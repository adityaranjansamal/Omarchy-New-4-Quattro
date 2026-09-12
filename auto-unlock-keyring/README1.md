I think I have found a solution. Feel free to critique and offer improvements. It appears that unencrypted gnome-keyring uses ini file format. Some apps, Proton (VPN, Bridge) being notorious, [store multi-line secrets](https://github.com/ProtonVPN/proton-vpn-gtk-app/issues/100). This renders keyring file unreadable by gnome-keyring. Vast majority of Linux users stick with encrypted keyring that unlocks with login password. Encrypted keyring format is not susceptible to the issue. Since Omarchy uses passwordless autologin we hit a corner case. 

Here's how to switch to encrypted keyring that automatically unlocks on autologin. This solves keyring file corruption issue.

---

### The Logic
Since your entire root filesystem (including `/etc` and `/root`) is encrypted by LUKS:
1.  Any file stored on your hard drive is physically secured by your LUKS password.
2.  The file cannot be read until **you** type your LUKS password at boot.
3.  Once the kernel boots and mounts the drive, Root can read the file.

---

### Step 1: Create the Secret Keyfile
We will generate a strong, random password and save it to a file that only Root can read.

1.  Generate the key and save it to `/etc/keyring_secret`:
    ```bash
    # Generate 32 bytes of random data, base64 encoded, save to file
    sudo sh -c 'openssl rand -base64 32 > /etc/keyring_secret'
    ```

2.  **Lock down permissions**:
    ```bash
    # Ensure ONLY root can read/write this.
    sudo chmod 600 /etc/keyring_secret
    sudo chown root:root /etc/keyring_secret
    ```

### Step 2: Set GNOME Keyring to use this Secret
You need to update your keyring to use the content of that file as its password.

1.  Read the secret so you can copy it:
    ```bash
    sudo cat /etc/keyring_secret
    ```
2. Select it and copy to clipboard
3.  Open **Passwords and Keys** (Seahorse). Install if not present.
4.  Right-click **Login** keyring -> **Change Password**.
5.  Enter your old password (should be blank by default).
6.  Paste the long string you copied as the **New Password**.

### Step 3: Create the Unlock Script

Create and edit `/usr/local/sbin/unlock-keyring-secure.sh`:

```bash
#!/bin/bash

# Define your user and UID (1000 is the most common)
TARGET_USER="your_username"
USER_UID=1000
SECRET_FILE="/etc/keyring_secret"

# 1. Read the password from the locked-down file
# Only root can run this script, and only root can read that file.
if [ -f "$SECRET_FILE" ]; then
    PASS=$(cat "$SECRET_FILE")
else
    echo "Keyring secret file not found!"
    exit 1
fi

# 2. Inject into the user's keyring daemon
if [ -n "$PASS" ]; then
    runuser -u "$TARGET_USER" -- env XDG_RUNTIME_DIR="/run/user/$USER_UID" \
    sh -c "echo -n '$PASS' | gnome-keyring-daemon --unlock"
fi
```
#### Step 3.1: Make script executable

```shell
sudo chmod +x /usr/local/sbin/unlock-keyring-secure.sh
```

### Step 4: Create and enable unlock service
`/etc/systemd/system/keyring-unlock-root.service`:

```ini
[Unit]
Description=Unlock User Keyring via Root File
# Wait until the user session is theoretically ready
After=user-runtime-dir@1000.service
Requires=user-runtime-dir@1000.service

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/unlock-keyring-secure.sh
User=root

[Install]
WantedBy=multi-user.target
```

Enable it:
```bash
sudo systemctl daemon-reload
sudo systemctl enable keyring-unlock-root.service
```

You may still be asked to unlock keyring at the next reboot. Copy password by running
    ```bash
    sudo cat /etc/keyring_secret
    ```
Then tick autounlock on login box.

Profit!
