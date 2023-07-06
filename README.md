# sea-me-hackathon-2023

## Contents
- [VMware Workstation17](#step-1)
- [Step 2](#step-2)
- [Step 3](#step-3)
---

This project provides a set Ubuntu image file. Therefore, you need to install VMware to use image files.<br><br>

### VMware Workstation17

https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html<br><br><br><br>





#### install Ubuntu
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/103899b6-ddb3-4683-a5bd-52689cf37e62" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="install_ubuntu"></img><br><br>


<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/7eccbd12-e5b6-47f4-a89f-5bd6cfd712ad" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="installimage1"></img><br><br><br><br>


#### install iso file
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/14af5302-b502-448e-a278-a33c94ff9213" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="installimage2"></img><br><br><br><br>









#### personalize Linux
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/99b9f72b-0b7c-4be0-9115-05fb0c717fdb" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="install4"></img>


username : avees

password : nvidia<br><br><br><br>


<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/705c89d8-ad3f-4709-a8e2-b615046d4782" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="installimage3"></img>





#### hardware setup
You should set Memory and Processors in recommended range<br>
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/0c0147a9-ae4c-493f-81a0-3fe76e7251b3" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="install_ram"></img><br><br><br><br>



#### power on
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/ba02f129-df3d-4936-aba5-88c37c553112" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="power on"></img><br><br><br><br>




#### login ubuntu
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/de8ff45e-6300-46a9-ac82-1b571c5e6356" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="login"></img><br><br><br><br>




#### windows settings for VMware WIFI (WIN10)


<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/39679920-dbbe-410c-9efb-f930d1135a5c" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="Untitled"></img><br><br>





<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/7479d59d-bb6d-4602-9413-971ea376a2ea" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="vmware_wifi1"></img><br><br>


<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/71b66e42-8dcb-4268-bbea-73c0bb558753" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="winwifiset1"></img><br><br><br><br>





#### VMware settings (Edit -> Virtual Network Editor)
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/56a925ee-be6a-406d-b937-520cba8535a9" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="vmware1"></img><br><br>



#### change settings
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/20d9b8b8-20c1-4081-b732-6a15680edec6" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="virtualneteditor"></img><br><br>



#### VMnet0 Bridged check (set VMnet0 Bridged(Automatic) -> Apply -> OK)
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/72f990b8-08ca-45d4-af25-d527a5484636" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="bridge"></img><br><br>


### Ubuntu Settings
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/6c2d604b-f0cb-44f7-a162-0f96415d8583" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="wifiubuntuset1"></img><br><br>

### Network Adapter (Custom: VMnet0)
<img src="https://github.com/AveesLab/sea-me-hackathon-2023/assets/125881959/f0583e5e-d6c8-4809-b91a-9bda2d9d206f" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="SetVMnet0"></img><br><br><br>




### network ping check
If the network settings of the two devices are well established, the ping test result can be checked as follows.<br>
If ping transmission between the two devices is successful, preparations for vsomeip communication are completed.<br>
<pre>
<code>
//check your device's IP address
ifconfig -a
</code>
</pre>
  <img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/ebf358fd-5c51-41a5-ad92-6976392c2d01" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="ifconfig-a"></img><br>


### ping to TX2
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/06ef3f9e-3e89-468e-aa5b-1985d7b73dae" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="ping_to_tx2"></img><br>


### ping to laptop VMware
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/349ef132-b782-4f6d-bb54-e722a2ff6308" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="ping to laptop"></img><br><br>


* * *
# commonapi, vsomeip settings
follow the instructions below for setting up commonapi and vsomeip libraries<br><br>
In the make-jx command, 'x' is the number of processes on your device.


#### Install OpenJDK Java 8
<pre>
<code>
sudo apt update
sudo apt install openjdk-8-jdk

java -version
//check version 1.8.0_xxx 
</code>
</pre>
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/61b5d906-0877-4a36-b949-08d3d99a72a4" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="java_version"></img>


<pre>
<code>
sudo apt-get install libboost-all-dev

  // build the commonAPI runtime library
cd ~
mkdir build-commonapi && cd build-commonapi


git clone https://github.com/GENIVI/capicxx-core-runtime.git
cd capicxx-core-runtime/
git checkout 3.2.0
mkdir build
cd build
cmake ..
make -jx
</code>
</pre>
###### result
<img src="https://github.com/AveesLab/hackathon-someip/assets/125881959/b9498614-b4d3-4786-8232-66171ede298e" width="70%" height="50%" title="px(픽셀) 크기 설정" alt="result"></img>


<pre>
<code>
cd ~
mkdir project-hello
cd project-hello
mkdir fidl
cd fidl
</code>
</pre>

*
*



### Download code generator 3.2.0.1
<pre>
<code>
cd ~
mkdir generator && cd generator
wget https://github.com/COVESA/capicxx-core-tools/releases/download/3.2.0.1/commonapi_core_generator.zip
unzip commonapi_core_generator.zip -d core-generator
cd core-generator
chmod +x commonapi-core-generator-linux-x86_64
</code>
</pre>



### Download someip code generator 3.2.0.1
<pre>
<code>
cd ~/generator
wget https://github.com/COVESA/capicxx-someip-tools/releases/download/3.2.0.1/commonapi_someip_generator.zip
unzip commonapi_someip_generator.zip -d someip-generator
cd someip-generator
chmod +x commonapi-someip-generator-linux-x86_64
</code>
</pre>


### Run generator
<pre>
<code>
cd ~/project-hello
../generator/core-generator/commonapi-core-generator-linux-x86_64 -sk ./fidl/HelloWorld.fidl -d ./src-gen-hello
../generator/someip-generator/commonapi-someip-generator-linux-x86_64 ./fidl/HelloWorld.fdepl -d ./src-gen-hello
</code>
</pre>


### Write the client and the service application
<pre>
<code>
cd ~/project-hello
mkdir src && cd src
</code>
</pre>



####  Make 4 files in src directory 
*
*
*
*

#### Write CMakeLists.txt on project directory
*

### build and run
<pre>
<code>
mkdir build
cd build
cmake ..
make -jx
</code>
</pre>

### Execute Service, Client in two terminals

