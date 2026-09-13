Add the 81-uvcvideo.rules to  
```
/etc/udev/rules.d/
```  
Use this command assuming already cloned the file and in the current directory  
```bash
sudo cp /etc/udev/rules.d/81-uvcvideo.rules
```  
Check the before and after output:  
```
sudo v4l2-ctl --get-ctrl=power_line_frequency
```  
1: 50HZ - India  
2: 60HZ - US and others