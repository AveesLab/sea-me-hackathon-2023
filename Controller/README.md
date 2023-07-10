# Controller Settings
<br>

### git clone
<pre>
<code>
cd ~
git clone https://github.com/AveesLab/sea-me-hackathon-2023.git
cd sea-me-hackathon-2023/Controller/src
</code>
</pre>

### Check your device IP adress
<pre>
<code>
ifconfig -a
</code>
</pre>
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/c0effc77-e929-49c0-b650-a2c1c1ee0cb1" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="Screenshot from 2023-07-10 17-47-56"></img><br><br>

<br><br>

### set route table
you have to set route table to use vsomeip communication
<pre>
<code>
route -n // check your route table
</code>
</pre>
add route table
<pre>
<code>
sudo route add -nv 224.244.224.24X [your ethernet ID]
</code>
</pre>

# set vsomeip_client.json
<pre>
<code>
cd sea-me-hackathon-2023/Controller/json
vim vsomeip_client.json
</code>
</pre>

### execute controller
<pre>
<code>
cd ~
cd sea-me-hackathon-2023/Controller/src
qmake .
make -jX
./controller
</code>
</pre>
<br><br>
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/52607ba3-f34c-420c-a8e1-aba5231c47f7" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="execontroller"></img><br><br>


### Controller display
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/31fb5ead-1796-49ba-a4fa-fa7fb004110e" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="displaycontroller"></img>

