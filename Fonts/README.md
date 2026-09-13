Install Nerd Fonts and Windows 11 25H2 Fonts on Linux  
Clone the repo  
Copy the directories to  
```
~/.local/share/fonts
```  
Then run these commands  
```bash
chmod -R 777 ~/.local/share/fonts/Win-11-Fonts/  
chmod -R 777 ~/.local/share/fonts/Nerd.Fonts/  
fc-cache -fv ~/.local/share/fonts
```  
Reboot the computer.