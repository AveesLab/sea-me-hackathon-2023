# SEA:ME@Korea 2023 Summer Hackathon<br>

During this hackathon, your mission is to develop a new digital instrument cluster system based on our baseline implementation in this repository. We'll provide you an Nvidia Jetson TX 2 embedded board. However, you have to bring at least one intel CPU-based (Windows or Ubuntu Linux) laptop as a development environment. If you use a Windows laptop, you have to install VMware and Ubuntu Linux as a guest operating system. If you bring a native Ubuntu Linux laptop, that is also okay. Note that since we provide a preconfigured VMware image, using VMware is a little bit more convinient if you are not used to the Linux development environment.

## Contents
- [Step 1: Install OpenJDK Java 8](#step-1-install-openjdk-java-8)
- [Step 2: Install Boost.Asio library](#step-2-install-boostasio-library)
- [Step 3: Build the CommonAPI Runtime Library](#step-3-build-the-commonapi-runtime-library)
- [Step 4: Build the vsomeip Library](#step-4-build-the-vsomeip-library)
- [Step 5: Build the CommonAPI SOME/IP Runtime Library](#step-5-build-the-commonapi-someip-runtime-library)
- [Step 6: Install Qt](#step-6-install-qt)
- [Step 7: Execute Cluster & Controller](#step-7-Execute-Cluster-and-Controller)
---
<br/>

# CommonAPI vSomeIP QT Setup 
If you have your own Ubuntu PC and don't want to use VMware, follow the steps below.<br>
However, if you want to use VMware, click the following below.

- [VMware Ubuntu image](https://github.com/AveesLab/sea-me-hackathon-2023/blob/master/VMware%20Ubuntu%20image/README.md)<br>

## Step 1: Install OpenJDK Java 8
```bash
sudo apt update
sudo apt install openjdk-8-jdk
```

You can check installation

```bash
java --version
```

If you have installed both OpenJDK 8 and 11, your default version will OpenJDK 11.
![스크린샷, 2023-07-07 21-58-18](https://github.com/AveesLab/sea-me-hackathon-2023/assets/96398568/49d28f85-6f4f-4ca6-a971-abfa95dd7f68)

To manually set a Java version, start by running the following command

```bash
sudo update-alternatives --config java
```

Select number and set OpenJDK 8 as the system default
![스크린샷, 2023-07-07 21-58-41](https://github.com/AveesLab/sea-me-hackathon-2023/assets/96398568/130277ce-b1bd-4c0c-8375-8a877ab1c869)
```bash
java -version
```
![스크린샷, 2023-07-07 21-59-08](https://github.com/AveesLab/sea-me-hackathon-2023/assets/96398568/f3c6b169-3de6-4bba-83ba-087a9e92da07)


<br/>

## Step 2: Install Boost.Asio library
Install Boost-dev
```bash
sudo apt-get install libboost-all-dev
```

<br/>

## Step 3: Build the CommonAPI Runtime Library

Make working directory. In my case `build-commonapi`

```bash
cd ~
mkdir build-commonapi && cd build-commonapi
```

Start with fetching the source code of CommonAPI:

```bash
git clone https://github.com/GENIVI/capicxx-core-runtime.git
cd capicxx-core-runtime/
git checkout 3.2.0
mkdir build
cd build
cmake ..
make -j6
sudo make install
```

Result:

```bash
[100%] Linking C shared library libCommonAPI.so
[100%] Built target CommonAPI
```

<br/>

## Step 4: Build the vsomeip Library


```bash
sudo apt-get install asciidoc source-highlight doxygen graphviz libgtest-dev
```
Before download SOME/IP Runtime library, you should download vsomeip. Because CommonAPI C++ SOME/IP need vsomeip.

```bash
cd ~
cd build-commonapi
git clone https://github.com/COVESA/vsomeip.git
cd vsomeip
git checkout 3.1.20.3
mkdir build
cd build
cmake -DENABLE_SIGNAL_HANDLING=1 -DDIAGNOSIS_ADDRESS=0x10 ..
make -j6
sudo make install
```


Result:

```bash
[100%] Linking CXX executable vsomeipd
[100%] Built target vsomeipd
```

<br/>

## Step 5: Build the CommonAPI SOME/IP Runtime Library

Download CommonAPI SOME/IP Runtime Library and change version

```bash
cd ~
cd build-commonapi
git clone https://github.com/GENIVI/capicxx-someip-runtime.git
cd capicxx-someip-runtime/
git checkout 3.2.0
mkdir build
cd build
cmake -DUSE_INSTALLED_COMMONAPI=OFF ..
make -j6
sudo make install

```

Result:

```bash
[100%] Linking CXX shared library libCommonAPI-SomeIP.so
[100%] Built target CommonAPI-SomeIP
```

Add library path
```bash
cd ~
sudo vi .bashrc
```
Add the command at the lowest line.
```bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
```

write the bashrc and exit

*in terminal*
```bash
source .bashrc
```
<br/>



## Step 6: Install Qt


```bash
sudo apt-get install qt5-default
sudo apt-get install qtcreator
sudo apt-get install qtdeclarative5-dev
```

You must install Qt module
```bash
sudo apt-get install qtmultimedia5-dev
sudo apt-get install qml-module-qtquick-controls2
sudo apt-get install libqt5multimediawidgets5 libqt5multimedia5
sudo apt-get install libqt5multimedia5-plugins qml-module-qtmultimedia
```


<br/>

## Step 7: Execute Cluster and Controller
The setup for CommonAPI vSomeIP QT is now complete!<br>
You can run the Controller and Cluster by following the each README in the links below.
- [Cluster](https://github.com/AveesLab/sea-me-hackathon-2023/tree/master/Cluster)
- [Controller](https://github.com/AveesLab/sea-me-hackathon-2023/tree/master/Controller)
