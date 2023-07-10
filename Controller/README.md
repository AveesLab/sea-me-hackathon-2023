# Controller Settings
<br>

### git clone
```bash
cd ~
git clone https://github.com/AveesLab/sea-me-hackathon-2023.git
cd sea-me-hackathon-2023/Controller/src
```
### Check your device IP adress
```bash
ifconfig -a
```
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/760acec3-8221-4dad-8126-9baef35b5a87" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="ifconfig"></img><br><br>

<br><br>

### set route table
you have to set route table to use vsomeip communication
```bash
route -n // check your route table
```
add route table
```bash
sudo route add -nv 224.244.224.24X [your ethernet ID]
```

# set vsomeip_client.json
```bash
cd sea-me-hackathon-2023/Controller/json
vim vsomeip_client.json
```

### execute controller
```bash
cd ~
cd sea-me-hackathon-2023/Controller/src
qmake .
make -jX
./controller
```
<br><br>
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/52607ba3-f34c-420c-a8e1-aba5231c47f7" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="execontroller"></img><br><br>


### Controller display
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/31fb5ead-1796-49ba-a4fa-fa7fb004110e" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="displaycontroller"></img>

