# Cluster Settings
<br>

### git clone
```bash
cd ~
git clone https://github.com/AveesLab/sea-me-hackathon-2023.git
cd sea-me-hackathon-2023/Cluster/src
```
### Check your device IP adress
```bash
ifconfig -a
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/fc6d9446-9ab7-4ce7-8a25-e5214dcd63fe" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="ifconfig"></img>

<br><br>

### set route table
Below image is before add route table<br>
you have to set route table to use vsomeip communication
```bash
route -n // check your route table
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/ba938278-007d-415b-a233-e94027b63fd1" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="Screenshot from 2023-07-10 18-44-12"></img>


Add route table
```bash
sudo route add -nv 224.244.224.24X [your ethernet ID] // example: sudo route add -nv 224.244.224.243 wlan0
route -n
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/901b3af8-f49c-4488-9286-cbb9bf7c21ff" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="Screenshot from 2023-07-10 18-44-36"></img>

# set vsomeip_client.json
```bash
cd sea-me-hackathon-2023/Controller/json
vim vsomeip_client.json
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/72ac5fa2-af54-4e44-93b3-21bc2fc21e80" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="json"></img>
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

