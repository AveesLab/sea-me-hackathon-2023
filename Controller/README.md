# Controller Settings
<br>

### Git clone
```bash
cd ~
git clone https://github.com/AveesLab/sea-me-hackathon-2023.git
cd sea-me-hackathon-2023/Controller/src
```

### Execute Cluster and Controller in one device
You can run two executables simultaneously on one device.<br>
The json file is only required when applying communication between devices.<br>
Please follow the instructions below to communicate between devices.<br>

```bash
qmake .
make -jX
```

### Open two terminals for Cluster and Controller
```bash
./cluster
./controller
```

## Device to Device Vsomeip communication


### Check your device IP adress
```bash
ifconfig -a
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/4f3a10b1-789a-44a2-9de4-06c5c214b0b5" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="ifconfig"></img><br><br>


<br><br>

### set route table
Below image is before add route table<br>
you have to set route table to use vsomeip communication
```bash
route -n // check your route table
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/146701fc-1170-4bf9-a48d-955b5fac4a66" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="Screenshot from 2023-07-10 18-09-36"></img>


Add route table
```bash
sudo route add -nv 224.244.224.24X [your ethernet ID] // example: sudo route add -nv 224.244.224.243 wlo1
route -n
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/b1346758-c9a8-4575-97dd-5102d353b8a8" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="Screenshot from 2023-07-10 18-10-28"></img>

# set vsomeip_client.json
```bash
cd sea-me-hackathon-2023/Controller/json
vim vsomeip_client.json
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/f85c7bb1-18b0-400e-8be7-0dfc4df93961" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="json"></img>

Change the unicast number to your IP address.

Change the multicast number to the multicast number assigned to you.

### execute controller
```bash
cd ~
cd sea-me-hackathon-2023/Controller/src
qmake .
make -jX
chmod +x do_controller.sh
./do_controller.sh
```



### Controller display
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/31fb5ead-1796-49ba-a4fa-fa7fb004110e" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="displaycontroller"></img>

