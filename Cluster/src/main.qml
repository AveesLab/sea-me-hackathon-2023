import QtQuick 2.7
import QtQuick.Controls 2.2
import "."
import QtMultimedia 5.5
import QtWebEngine 1.2
import QtWebView 1.0
import QtLocation 5.3
import QtPositioning 5.3
import QtQuick 2.7
import QtQuick.Controls 2.2
import "."
import QtMultimedia 5.5


ApplicationWindow {
    visible: true
    width: screen.width
    height: screen.height
    property string bState: "P"
    property string ex_bState: "P"
    property bool showWeather: false
    property bool showWarn: false
    property bool showLight: false
    property bool showLeft: false
    property bool showRight: false
    property bool enginestat : false
    property bool modestat : false
    property int fuelefftar : 20
    property int fueltar : 0
    property int temptar : 0
    //var actual_speed
    title: qsTr("Speedometer")

    // Background Image


    Image {
        id: backgroundImage
        sourceSize.height: screen.width
        sourceSize.width: screen.height
        anchors.fill: parent
        source: (bState === "S") ? "image/back_blue_s.png" : "image/back_blue.png"
    }

    Image {
        id: warnIcon
        sourceSize.height: screen.width
        sourceSize.width: screen.height
        anchors.fill: parent
        source: (bState === "S") ? "image/back_red_s.png" : "image/back_red.png"
        visible: showWarn
    }
    Image {
            id: ecoimage
            width: backgroundImage.width
            height: backgroundImage.height
            anchors{
                centerIn: backgroundImage
                verticalCenterOffset: -180
            }

            source: "image/city.png" // Replace with the path to your background image
            opacity : 0.2
            visible : modestat

        }
    Image {
        id: leftIcon
        //width: screen.width
        //height: screen.height
        sourceSize.height: screen.width
        sourceSize.width: screen.height
        anchors.fill: parent
        source: (bState === "S") ? "image/back_L_s.png" : "image/back_L.png"
        visible: showLeft
    }

    Image {
        id: rightIcon
        //width: screen.width
        //height: screen.height
        sourceSize.height: screen.width
        sourceSize.width: screen.height
        anchors.fill: parent
        source: (bState === "S") ? "image/back_R_s.png" : "image/back_R.png"
        visible: showRight
    }

    Image{
        id : sp_eff1
        anchors{
            centerIn: backgroundImage
            verticalCenterOffset: 210
        }
        scale:1.45
        opacity:0
        visible: sport_visible
        source: "image/sport_effect.png"
        property int duration : 400
    }
    Image{
        id : sp_eff1_5
    anchors{
        centerIn: backgroundImage
        verticalCenterOffset: 150
    }
    scale:1.2
    opacity:0
    visible: sport_visible
    source: "image/sport_effect.png"
    property int duration : 400
    }
    Image{
        id : sp_eff2
        anchors{
            centerIn: backgroundImage
            verticalCenterOffset: 90
        }
        scale: 0.95
        opacity:0
        visible: sport_visible
        source: "image/sport_effect.png"
        property int duration : 400
    }
    Image{
        id : sp_eff2_5
        anchors{
            centerIn: backgroundImage
            verticalCenterOffset: 40
        }
        scale:0.75
        opacity:0
        visible: sport_visible
        source: "image/sport_effect.png"
        property int duration : 400
    }
    Image{
        id : sp_eff3
        anchors{
            centerIn: backgroundImage
            verticalCenterOffset: 0
        }
        scale:0.6
        opacity:0
        visible: sport_visible
        source: "image/sport_effect.png"
        property int duration : 400
    }

    // speed gage
    Image {
        id: speedImage
        width: 500
        height: 500
        sourceSize.height: 1080
        sourceSize.width: 1920
        anchors.verticalCenterOffset: 175
        anchors.horizontalCenterOffset: -548
        anchors.centerIn: parent
        opacity: 0.6
        source: "image/dial_2.png" // Replace with the path to your arc image

    }
    Image {
        id: rpmImage
        x: -800
        y: 300
        width: 150
        height: 150
        anchors.verticalCenterOffset: 370
        anchors.horizontalCenterOffset: -730
        anchors.centerIn: parent
        source: "image/rpm.png" // Replace with the path to your arc image
        opacity: 0.75
    }
    WebView {
        id: naverMapView
        width: parent.width * 0.4
        height: parent.width * 0.3  // 가로 및 세로 크기를 동일하게 설정
        scale: 1
        anchors {
            centerIn: parent
            horizontalCenterOffset: 0
            verticalCenterOffset: -400
        }
        url: "https://m.map.naver.com/"
        visible: showNaverMap
        opacity: 0.6
    }

    // Car Image
    Image {
        id: carImage
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 185 // Adjust the height of the car image
        source: "image/car_back.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        visible: bState !== "P" || showLeft || showRight || showWarn
    }
    Image {
        id: car_back_L
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 185 // Adjust the height of the car image
        source: "image/car_back_L.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        visible: showLeft
    }

    Image {
        id: car_back_R
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 185 // Adjust the height of the car image
        source: "image/car_back_R.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        visible: showRight
    }
    Image {
        id: car_back_LR
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 185 // Adjust the height of the car image
        source: "image/car_back_LR.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        visible: showWarn && bState !=="P"
    }
    Image {
        id: car_front
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        source: "image/car_front.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: 0
            bottomMargin: 185
        }
        visible: bState == "P" & !showWarn & !showLeft & !showRight
    }
    Image {
        id: weatherIcon
        width: 150
        height: 150
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -180
            margins: 20
        }
        source: weatherAPI.weatherIcon
        visible: showWeather
    }

    Audio{
        id:start_sound
        source:"image/start_sound.mp3"
    }

//anime==================================================

//    WebView {
//        id: naverMapView
//        width: parent.width * 0.4
//        height: parent.width * 0.3  // 가로 및 세로 크기를 동일하게 설정
//        scale: 1
//        anchors {
//            verticalCenterOffset: -400
//            centerIn: parent
//        }
//        url: "https://m.map.naver.com/"
//        visible: showNaverMap
//        opacity: 0.6
//    }

    ParallelAnimation {
        id: map_move
        PropertyAnimation{
            target: naverMapView
            property: "scale"
            from: naverMapView.scale
            to: 0.65
            duration: 0
        }
        PropertyAnimation{
            target: naverMapView
            property: "y"
            from: 0
            to: -40
            duration: 0
        }

    }

    ParallelAnimation {
        id: map_move_off
        PropertyAnimation{
            target: naverMapView
            property: "scale"
            from: naverMapView.scale
            to: 1
            duration: 0
        }
        PropertyAnimation{
            target: naverMapView
            property: "y"
            from: naverMapView.y
            to: 40
            duration: 0
        }
    }

    SequentialAnimation{
           id : sport_ani_s
           loops : Animation.Infinite
           NumberAnimation{
              target: sp_eff3
              property: "opacity"
              from: 0
              to: 0.4
              duration: 100;
         }
           NumberAnimation{
              target: sp_eff3
              property: "opacity"
              from: 0.4
              to: 0
              duration: 100;
          }
           NumberAnimation{
               target: sp_eff2_5
               property: "opacity"
               from: 0
               to: 0.5
               duration: 100;
           }

           NumberAnimation{
               target: sp_eff2_5
               property: "opacity"
               from: 0.5
               to: 0
               duration: 100;
           }
           NumberAnimation{
               target: sp_eff2
               property: "opacity"
               from: 0
               to: 0.6
               duration: 100;
           }

           NumberAnimation{
               target: sp_eff2
               property: "opacity"
               from: 0.6
               to: 0
               duration: 100;
           }
           NumberAnimation{
               target: sp_eff1_5
               property: "opacity"
               from: 0
               to: 0.7
               duration: 100;
           }
           NumberAnimation{
               target: sp_eff1_5
               property: "opacity"
               from: 0.7
               to: 0
               duration: 100;
           }
           NumberAnimation{
               target: sp_eff1
               property: "opacity"
               from: 0
               to: 0.8
               duration: 100;
           }
           NumberAnimation{
               target: sp_eff1
               property: "opacity"
               from: 0.8
               to: 0
               duration: 100;
           }


    }

    SequentialAnimation{
        id: seq_ani
        ParallelAnimation{
            PropertyAnimation{
                target: gearImage
                property: "scale"
                from: gearImage.scale
                to: 0.45
                duration: 1500
            }
            PropertyAnimation {
                target: gearImage
                property: "y"
                from: gearImage.y
                to: weatherIcon.y - 60
                duration: 1500
            }
        }
        PropertyAnimation{
            target: background
            property: "opacity"
            from: background.opacity
            to: 0.1
            duration: 1500
        }
        ParallelAnimation{
            PropertyAnimation{
                target: background
                property: "opacity"
                from: 0.1
                to: 0
                duration: 500
            }
            PropertyAnimation{
                target: lighttest1
                property: "opacity"
                from: 0
                to : 0.8
                duration : 300
            }
            PropertyAnimation{
                target: lighttest2
                property: "opacity"
                from: 0
                to : 0.8
                duration : 300
            }
        }
        ParallelAnimation{
            PropertyAnimation{
                target: lighttest1
                property: "opacity"
                from: 0.8
                to : 0
                duration :300
            }
            PropertyAnimation{
                target: lighttest2
                property: "opacity"
                from: 0.8
                to : 0
                duration : 30
            }
        }
    }

    SequentialAnimation{
        id: seq_ani_off
        PropertyAnimation{
            target: background
            property: "opacity"
            from: background.opacity
            to: 1
            duration: 2000
        }
        ParallelAnimation{
            PropertyAnimation{
                target: gearImage
                property: "scale"
                from: gearImage.scale
                to: 3
                duration: 1500
            }
            PropertyAnimation {
                target: gearImage
                property: "y"
                from: gearImage.y
                to: backgroundImage.height / 2 - gearImage.height / 2
                duration: 1500
            }
        }
    }


    Timer {
        id: leftblinkTimer
        interval: 500 // Blink every 500ms
        running: false // Don't start running automatically
        repeat: true
        onTriggered: {
            leftIcon.visible = !leftIcon.visible // Toggle visibility
            car_back_L.visible = !car_back_L.visible
        }
    }

    Timer {
        id: rightblinkTimer
        interval: 500 // Blink every 500ms
        running: false // Don't start running automatically
        repeat: true
        onTriggered: {
            rightIcon.visible = !rightIcon.visible // Toggle visibility
            car_back_R.visible = ! car_back_R.visible
        }
    }

    Timer {
        id: warnblinkTimer
        interval: 500 // Blink every 500ms
        running: false // Don't start running automatically
        repeat: true
        onTriggered: {
            warnIcon.visible = !warnIcon.visible // Toggle visibility
            car_back_LR.visible = !car_back_LR.visible
        }
    }

    Image {
        id: lightIcon
        width: 100
        height: 100
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: 170
            margins: 30
        }
        source: "image/star.png"
        visible: showLight


    }

            Image {
                id: num0
                width: 14
                height: 23
                anchors.verticalCenterOffset: 275
                anchors.horizontalCenterOffset: -716
                anchors.centerIn: parent
                source: "image/0.png"
                visible: true
                scale: (speedReceiver.speedValue<5) ? 1.5 : 1.0
                opacity: (speedReceiver.speedValue<5) ? 1.0 : 0.6

            }
            Image {
                id: num20
                width: 29
                height: 25
                anchors.verticalCenterOffset: 211
                anchors.horizontalCenterOffset: -730
                anchors.centerIn: parent
                source: "image/20.png"
                visible: true
                scale: (speedReceiver.speedValue>17.5 & speedReceiver.speedValue<22.5) ? 1.5 : (speedReceiver.speedValue>15 & speedReceiver.speedValue<25) ?  1.3 : 1.0
                opacity: (speedReceiver.speedValue>17.5 & speedReceiver.speedValue<22.5) ? 1.0 : (speedReceiver.speedValue>15 & speedReceiver.speedValue<25) ?  0.8 : 0.6
            }
            Image {
                    id: num40
                    width: 34
                    height: 21
                    anchors.verticalCenterOffset: 148
                    anchors.horizontalCenterOffset: -732
                    anchors.centerIn: parent
                    source: "image/40.png"
                    visible: true
                    scale: (speedReceiver.speedValue>37.5 & speedReceiver.speedValue<42.5) ? 1.5 : (speedReceiver.speedValue>35 & speedReceiver.speedValue<45) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>37.5 & speedReceiver.speedValue<42.5) ? 1.0 : (speedReceiver.speedValue>35 & speedReceiver.speedValue<45) ?  0.8 : 0.6
                }
            Image {
                    id: num60
                    width: 31
                    height: 22
                    anchors.verticalCenterOffset: 87
                    anchors.horizontalCenterOffset: -709
                    anchors.centerIn: parent
                    source: "image/60.png"
                    visible: true
                    scale: (speedReceiver.speedValue>57.5 & speedReceiver.speedValue<62.5) ? 1.5 : (speedReceiver.speedValue>55 & speedReceiver.speedValue<65) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>57.5 & speedReceiver.speedValue<62.5) ? 1.0 : (speedReceiver.speedValue>55 & speedReceiver.speedValue<65) ?  0.8 : 0.6
                }
            Image {
                    id: num80
                    width: 33
                    height: 21
                    anchors.verticalCenterOffset: 37
                    anchors.horizontalCenterOffset: -666
                    anchors.centerIn: parent
                    source: "image/80.png"
                    visible: true
                    scale: (speedReceiver.speedValue>77.5 & speedReceiver.speedValue<82.5) ? 1.5 : (speedReceiver.speedValue>75 & speedReceiver.speedValue<85) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>77.5 & speedReceiver.speedValue<82.5) ? 1.0 : (speedReceiver.speedValue>75 & speedReceiver.speedValue<85) ?  0.8 : 0.6
                }
            Image {
                    id: num100
                    width: 44
                    height: 21
                    anchors.verticalCenterOffset: 4
                    anchors.horizontalCenterOffset: -612
                    anchors.centerIn: parent
                    source: "image/100.png"
                    visible: true
                    scale: (speedReceiver.speedValue>97.5 & speedReceiver.speedValue<102.5) ? 1.5 : (speedReceiver.speedValue>95 & speedReceiver.speedValue<105) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>97.5 & speedReceiver.speedValue<102.5) ? 1.0 : (speedReceiver.speedValue>95 & speedReceiver.speedValue<105) ?  0.8 : 0.6
                }
            Image {
                    id: num120
                    width: 62
                    height: 45
                    anchors.verticalCenterOffset: -11
                    anchors.horizontalCenterOffset: -544
                    anchors.centerIn: parent
                    source: "image/120.png"
                    visible: true
                    scale: (speedReceiver.speedValue>117.5 & speedReceiver.speedValue<122.5) ? 1.5 : (speedReceiver.speedValue>115 & speedReceiver.speedValue<125) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>117.5 & speedReceiver.speedValue<122.5) ? 1.0 : (speedReceiver.speedValue>115 & speedReceiver.speedValue<125) ?  0.8 : 0.6
                }
            Image {
                    id: num140
                    width: 42
                    height: 23
                    anchors.verticalCenterOffset: 4
                    anchors.horizontalCenterOffset: -476
                    anchors.centerIn: parent
                    source: "image/140.png"
                    visible: true
                    scale: (speedReceiver.speedValue>137.5 & speedReceiver.speedValue<142.5) ? 1.5 : (speedReceiver.speedValue>135 & speedReceiver.speedValue<145) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>137.5 & speedReceiver.speedValue<142.5) ? 1.0 : (speedReceiver.speedValue>135 & speedReceiver.speedValue<145) ?  0.8 : 0.6
                }
            Image {
                    id: num160
                    width: 47
                    height: 21
                    anchors.verticalCenterOffset: 38
                    anchors.horizontalCenterOffset: -427
                    anchors.centerIn: parent
                    source: "image/160.png"
                    visible: true
                    scale: (speedReceiver.speedValue>157.5 & speedReceiver.speedValue<162.5) ? 1.5 : (speedReceiver.speedValue>155 & speedReceiver.speedValue<165) ?  1.3 : 1.0
                    opacity: (speedReceiver.speedValue>157.5 & speedReceiver.speedValue<162.5) ? 1.0 : (speedReceiver.speedValue>155 & speedReceiver.speedValue<165) ?  0.8 : 0.6
                }
            Image {
                id: num180
                width: 48
                height: 24
                anchors.verticalCenterOffset: 86
                anchors.horizontalCenterOffset: -387
                anchors.centerIn: parent
                source: "image/180.png"
                visible: true
                scale: (speedReceiver.speedValue>177.5 & speedReceiver.speedValue<182.5) ? 1.5 : (speedReceiver.speedValue>175 & speedReceiver.speedValue<185) ?  1.3 : 1.0
                opacity: (speedReceiver.speedValue>177.5 & speedReceiver.speedValue<182.5) ? 1.0 : (speedReceiver.speedValue>175 & speedReceiver.speedValue<185) ?  0.8 : 0.6
            }
            Image {
                id: num200
                width: 47
                height: 25
                anchors.verticalCenterOffset: 148
                anchors.horizontalCenterOffset: -362
                anchors.centerIn: parent
                source: "image/200.png"
                visible: true
                scale: (speedReceiver.speedValue>197.5 & speedReceiver.speedValue<202.5) ? 1.5 : (speedReceiver.speedValue>195 & speedReceiver.speedValue<205) ?  1.3 : 1.0
                opacity: (speedReceiver.speedValue>197.5 & speedReceiver.speedValue<202.5) ? 1.0 : (speedReceiver.speedValue>195 & speedReceiver.speedValue<205) ?  0.8 : 0.6
            }
            Image {
                id: num230
                width: 46
                height: 26
                anchors.verticalCenterOffset: 209
                anchors.horizontalCenterOffset: -362
                anchors.centerIn: parent
                source: "image/230.png"
                visible: true
                scale: (speedReceiver.speedValue>227.5 & speedReceiver.speedValue<232.5) ? 1.5 : (speedReceiver.speedValue>225 & speedReceiver.speedValue<235) ?  1.3 : 1.0
                opacity: (speedReceiver.speedValue>227.5 & speedReceiver.speedValue<232.5) ? 1.0 : (speedReceiver.speedValue>225 & speedReceiver.speedValue<235) ?  0.8 : 0.6
            }
            Image {
                id: num260
                width: 48
                height: 25
                anchors.verticalCenterOffset: 276
                anchors.horizontalCenterOffset: -387
                anchors.centerIn: parent
                source: "image/260.png"
                visible: true
                scale: (speedReceiver.speedValue>257.5 & speedReceiver.speedValue<262.5) ? 1.5 : (speedReceiver.speedValue>255 & speedReceiver.speedValue<265) ?  1.3 : 1.0
                opacity: (speedReceiver.speedValue>257.5 & speedReceiver.speedValue<262.5) ? 1.0 : (speedReceiver.speedValue>255 & speedReceiver.speedValue<265) ?  0.8 : 0.6
            }
    // current speed text
    Text {
        id: speedText
        font.pixelSize: 130
        font.italic: true
        font.bold: true
        anchors.verticalCenterOffset: 150
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: speedImage
        text: speedReceiver.speedValue
        color: speedReceiver.speedValue <= 110 ? 'white' : 'red'


    }

    Text {
        id: kmText
        font.pixelSize: 20
        font.italic: true
        font.bold: true
        anchors.verticalCenterOffset: 220
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: speedImage
        text: "km/h"
        color: 'white'
    }
    // parking, backward warning text
    Text {
        id: aroundText
        font.pixelSize: 20
        font.italic: true
        font.bold: true
        anchors {
            verticalCenterOffset: -55
            horizontalCenterOffset: 0
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
//        anchors.verticalCenterOffset: -90
//        anchors.horizontalCenterOffset: 0
//        anchors.centerIn: parent
        text: "CHECK OUT \n YOUR SURROUNDINGS"
        color: 'red'
        visible: bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && (showRight || showLeft));
    }

    Text {
        id: temperature
        font.pixelSize: 30
        font.bold: true
        font.italic: true
        color: 'white'
        anchors.horizontalCenter: weatherIcon.horizontalCenter
        anchors.top: weatherIcon.bottom
        anchors.topMargin: -30
        text: weatherAPI.temperature + "°C"
        anchors.horizontalCenterOffset: 1
        visible: showWeather
    }

    Canvas {
        id: speedpointer
        width: parent.width
        height: parent.height
        anchors.verticalCenterOffset: 175
        anchors.horizontalCenterOffset: -548
        rotation: 180
        anchors.centerIn: parent
        onPaint: {
            var ctx = getContext('2d');
            var centerX = width / 2;
            var centerY = height / 2;

            // Clear the canvas
            ctx.clearRect(0, 0, width, height);
            var xx = (speedReceiver.speedValue > 200) ? 19 : 20.5;
            // Draw the speed bar
            //var angle = (speedReceiver.speedValue - 35) * Math.PI / 180; // Convert speed to angle
            var angle = (speedReceiver.speedValue > 200) ? (170+42/60*(speedReceiver.speedValue-200))*Math.PI/180 : (-35 + xx * speedReceiver.speedValue/20)* Math.PI / 180;
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(centerX + 160 * Math.cos(angle), centerY + 160 * Math.sin(angle));
            ctx.lineWidth = 10;
            ctx.strokeStyle = '#ff0000';
            ctx.stroke();
        }

        Connections {
            target: speedReceiver
            onSpeedValueChanged: {
                speedpointer.requestPaint()
            }
        }
    }

    Canvas {
        id: rpmpointer
        width: parent.width
        height: parent.height
        anchors.verticalCenterOffset: 370
        anchors.horizontalCenterOffset: -730
        rotation: 180
        anchors.centerIn: parent
        onPaint: {
            var ctx = getContext('2d');
            var centerX = width / 2;
            var centerY = height / 2;

            // Clear the canvas
            ctx.clearRect(0, 0, width, height);

            // Draw the speed bar
            var angle = ((rpmReceiver.rpmValue / 30) -45) * Math.PI / 180; // Convert rpm to angle
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(centerX + 45 * Math.cos(angle), centerY + 45 * Math.sin(angle));
            ctx.lineWidth = 4;
            ctx.strokeStyle = '#ff0000';
            ctx.stroke();
        }

        Connections {
            target: rpmReceiver
            onRpmValueChanged: {
                rpmpointer.requestPaint()
            }
        }
    }


    Connections {
        target: buttonsReceiver
        onButtonsValueChanged: {
            var buttonValue = buttonsReceiver.buttonsValue;
            if(buttonValue ==="Engine"){
                if(enginestat){
                    seq_ani_off.start();
                    enginestat =!enginestat;
                }else{
                    seq_ani.start();
                    start_sound.play();
                    enginestat =!enginestat;
                }
            }

            if (buttonValue ==="S") {
                if(modestat){
                    sport_ani_s.stop();
                    modestat = !modestat;
                }else{
                    sport_ani_s.start();
                    modestat = !modestat;
                }
            }

            if (buttonValue === "P" || buttonValue === "R" || buttonValue === "N" || buttonValue === "D" || buttonValue === "S") {


                bState = buttonValue;
                gearText.text = bState;
                if(bState === "S"){
                    gearText.color = 'red';
                }
                else{
                    gearText.color = 'white';
                }

                carImage.visible = bState !== "P";
                aroundText.visible = backImage.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && (showRight || showLeft));
                rvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showRight)
                lvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showLeft)
            }
            else if(buttonValue === "Weather"){
                showWeather = !showWeather;
                weatherAPI.requestWeather("Seoul");
            }
            else if(buttonValue === "Warn"){
                if (showWarn) {
                    warnblinkTimer.stop(); // Stop blinking
                    warnIcon.visible = false;// Ensure the icon is hidden
                    car_back_LR.visible = false;
                } else {
                    if(showRight){
                        showRight = false;
                        rightblinkTimer.stop();
                        rightIcon.visible = false;
                        car_back_R.visible = false;
                    }
                    if(showLeft){
                        showLeft = false;
                        leftblinkTimer.stop();
                        leftIcon.visible = false;
                        car_back_L.visible = false;
                    }
                    warnblinkTimer.start(); // Start blinking
                }
                showWarn = !showWarn;

                aroundText.visible = backImage.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && (showRight || showLeft));
                rvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showRight)
                lvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showLeft)
            }
            else if(buttonValue === "Left"){
                if (showLeft) {
                    leftblinkTimer.stop(); // Stop blinking
                    leftIcon.visible = false;
                    car_back_L.visible = false;// Ensure the icon is hidden
                } else {
                    if(showRight){
                        showRight = false;
                        rightblinkTimer.stop();
                        rightIcon.visible = false;
                        car_back_R.visible = false;
                    }
                    if(showWarn){
                        showWarn = false;
                        warnblinkTimer.stop();
                        warnIcon.visible = false;
                        car_back_LR.visible = false;
                    }
                    leftblinkTimer.start(); // Start blinking
                }
                showLeft = !showLeft;

                aroundText.visible = backImage.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && (showRight || showLeft));
                rvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showRight)
                lvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showLeft)
            }
            else if(buttonValue === "Right"){
                if (showRight) {
                    rightblinkTimer.stop(); // Stop blinking
                    rightIcon.visible = false;
                    car_back_R.visible = false;// Ensure the icon is hidden
                } else {
                    if(showLeft){
                        showLeft = false;
                        leftblinkTimer.stop();
                        leftIcon.visible = false;
                        car_back_L.visible = false;
                    }
                    if(showWarn){
                        showWarn = false;
                        warnblinkTimer.stop();
                        warnIcon.visible = false;
                        car_back_LR.visible = false;
                    }
                    rightblinkTimer.start(); // Start blinking
                }
                showRight = !showRight;

                aroundText.visible = backImage.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && (showRight || showLeft));
                rvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showRight)
                lvideoOutput.visible = bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showLeft)
            }

            else if(buttonValue === "Light"){
                showLight = !showLight;
            }

            if (backImage.visible) {
                map_move.start();
            }
            else {
                map_move_off.start();
            }

//            if(ex_bState !== buttonValue && buttonValue !== "S")
//            {
//                sport_ani_s.stop();
//                sp_eff1.visible = sp_eff2.visible = sp_eff3.visible = sp_eff4.visible = sp_eff5.visible = false;
//                ecoimage.visible =true;
//            } else if (ex_bState !== buttonValue && buttonValue === "S"){
//                sport_ani_s.start();
//                sport_visible = true;
//                ecoimage.visible =false;
//            }

//            ex_bState = bState;
        }
    }
//    Image {
//        id: gearImage
//        width: 300
//        height: 300
//        scale: 0.5
//        anchors {
//            bottom: parent.bottom
//            horizontalCenter: parent.horizontalCenter
//            margins: -70
//        }
//        source: "image/volk.png" // Replace with the path to your image
//    }

    //back camera
   Image {
       id: backImage
       width: 700
       height: 300
       scale: 0.85
       //       anchors {
//           verticalCenterOffset: -354
//           horizontalCenterOffset: 0
//           horizontalCenter: parent.horizontalCenter
//           verticalCenter: parent.verticalCenter
//       }
       anchors.verticalCenterOffset: -210
       anchors.horizontalCenterOffset: 0
       anchors.centerIn: parent
       source: "image/backimage.png" // Replace with the path to your image
       visible: bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && (showRight || showLeft))
   }
    //right camera
    Camera {
        id: rcamera
        viewfinder.resolution: "640x480"
        deviceId: "/dev/video1"
    }

    //left camera
    Camera {
        id: lcamera
        viewfinder.resolution: "640x480"
        deviceId: "/dev/video2"
    }
   // left camera
    VideoOutput {
        id: lvideoOutput
        width: 492 // Set width of the camera output
        height: 441
        anchors.verticalCenterOffset: -317
        anchors.horizontalCenterOffset: -630 // Set height of the camera output
        anchors.horizontalCenter: parent.horizontalCenter // Center the output horizontally
        anchors.verticalCenter: parent.verticalCenter // Center the output vertically
        source: lcamera
        visible: bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showLeft)
    }

  //  right camera
    VideoOutput {
        id: rvideoOutput
        width: 492 // Set width of the camera output
        height: 441
        anchors.verticalCenterOffset: -317
        anchors.horizontalCenterOffset: 630 // Set height of the camera output
        anchors.horizontalCenter: parent.horizontalCenter // Center the output horizontally
        anchors.verticalCenter: parent.verticalCenter // Center the output vertically
        source: rcamera
        visible: bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showRight)
    }

    Image{
        id:leftmirr
        width:492
        height: 441
        anchors{
            centerIn: lvideoOutput
        }
        source:"image/leftmirr2.png"
        visible: bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showLeft)
    }
    Image{
        id:rightmirr
        width:492
        height: 441
        anchors{
            centerIn: rvideoOutput
        }
        source: "image/rightmirr2.png"
        visible: bState === "R" || bState === "P" || ((bState === "D" || bState === "S") && showRight)
    }

    Image {
                id: lighttest1
                width: 80
                height: 50
                scale: 3
                anchors{
                    centerIn: car_front
                    verticalCenterOffset: -20
                    horizontalCenterOffset: 160
                }
                opacity: 0
                source: "image/start_light.png" // Replace with the path to your image
            }
        Image {
                id: lighttest2
                width: 80
                height: 50
                scale: 3
                anchors{
                    centerIn: car_front
                    verticalCenterOffset: -20
                    horizontalCenterOffset: -170
                }
                opacity: 0
                source: "image/start_light.png" // Replace with the path to your image

            }
        Image {
            id: blackcircle
            x:-434
            y:300
            width: 130
            height: 130
            anchors{
                horizontalCenter: gearText.horizontalCenter
                verticalCenter: gearText.verticalCenter
            }

            opacity: 0.6

            source: "image/blackcircle.png" // Replace with the path to your image
        }

        Text {
            id: gearText
            x: -434
            y: 300
            font.pixelSize: 100
            font.italic: true
            font.bold: true
            anchors.verticalCenterOffset: -4
            anchors.horizontalCenterOffset: 361
            anchors.centerIn: rpmImage
            text: "P"
            color: 'white'
        }



        Image {
            id: fuelBackImage
            width: 500
            height: 500
            sourceSize.height: 1080
            sourceSize.width: 1920
            anchors.verticalCenterOffset: 175
            anchors.horizontalCenterOffset: 548
            anchors.centerIn: parent
            opacity: 0.6
            source: "image/dial_2.png" // Replace with the path to your arc image
            Text {
                id: fullText
                font.pixelSize: 20
                font.italic: true
                font.bold: true
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenter: fuelBackImage.horizontalCenter
                    verticalCenter: fuelBackImage.verticalCenter
                    horizontalCenterOffset: -125
                    verticalCenterOffset: -150
                }
                text: "F"
                color: 'white'
            }
            Text {
                id: emptyText
                font.pixelSize: 20
                font.italic: true
                font.bold: true
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenter: fuelBackImage.horizontalCenter
                    verticalCenter: fuelBackImage.verticalCenter
                    horizontalCenterOffset: -165
                    verticalCenterOffset: 110
                }
                text: "E"
                color: 'white'
            }
            Text {
                id: engineTempMaxText
                font.pixelSize: 20
                font.italic: true
                font.bold: true
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenter: fuelBackImage.horizontalCenter
                    verticalCenter: fuelBackImage.verticalCenter
                    horizontalCenterOffset: 125
                    verticalCenterOffset: -150
                }
                text: "H"
                color: 'red'
            }
            Text {
                id: engineTempMinText
                font.pixelSize: 20
                font.italic: true
                font.bold: true
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenter: fuelBackImage.horizontalCenter
                    verticalCenter: fuelBackImage.verticalCenter
                    horizontalCenterOffset: 165
                    verticalCenterOffset: 110
                }
                text: "C"
                color: 'white'
            }

            //연비
            Text {
                id: fuelEfficiencyText
                font.pixelSize: 20
                font.italic: true
                font.bold: true
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenterOffset: 10
                    verticalCenterOffset: 170
                }
                text: "Fuel Eff. >> " + "20km/l" + "\n" + "Dist. to Empty >> " + "1600km" + "\n" + "ODO >> 99999km"

                color: 'white'
            }
            Image {
                id: fuelImage
                source: "image/fuel.png"
                width: 20
                height: 20
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenterOffset: -190
                    verticalCenterOffset: -30
                }
            }
            Image {
                id: engineTempImage
                source: "image/enginetemp.png"
                width: 20
                height: 20
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenterOffset: 190
                    verticalCenterOffset: -30
                }
            }
            Text {
                property date firdate: new Date()
                id: timetext
                x: 300
                y: 300
                font.pixelSize: 20
                font.italic: true
                font.bold: true
                anchors {
                    centerIn: fuelBackImage
                    horizontalCenterOffset: 0
                    verticalCenterOffset: -170
                }
                text: firdate.toDateString() +"\n     " + firdate.toTimeString()
                color: 'white'
                function set() {
                    var currentdate = new Date()
                    timetext.text = currentdate.toDateString() +"\n     " + currentdate.toTimeString()
                }
            }
            Timer {
                id: textTimer
                interval: 1000
                repeat: true
                running: true
                onTriggered: timetext.set()
            }
        }




        Canvas {
            id: engineTemppointer
            width: parent.width
            height: parent.height
            anchors.verticalCenterOffset: 175
            anchors.horizontalCenterOffset: 548
            rotation: 180
            anchors.centerIn: parent
            onPaint: {
                var ctx = getContext('2d');
                var centerX = width / 2;
                var centerY = height / 2;

                // Clear the canvas
                ctx.clearRect(0, 0, width, height);

                // Draw the speed bar
                var angle = 180 * Math.PI / 180; // Convert speed to angle
                ctx.beginPath();
                ctx.moveTo(centerX, centerY);
                ctx.lineTo(centerX + 160 * Math.cos(angle), centerY + 160 * Math.sin(angle));
                ctx.lineWidth = 10;
                ctx.strokeStyle = '#ff0000';
                ctx.stroke();
            }

            Connections {
                target: speedReceiver
                onSpeedValueChanged: {
                    speedpointer.requestPaint()
                }
            }
        }



        Canvas {
            id: fuelpointer
            width: parent.width
            height: parent.height
            anchors.verticalCenterOffset: 175
            anchors.horizontalCenterOffset: 548
            rotation: 180
            anchors.centerIn: parent
            onPaint: {
                var ctx = getContext('2d');
                var centerX = width / 2;
                var centerY = height / 2;

                // Clear the canvas
                ctx.clearRect(0, 0, width, height);

                // Draw the speed bar
                var angle = (85 - 35) * Math.PI / 180; // Convert speed to angle
                ctx.beginPath();
                ctx.moveTo(centerX, centerY);
                ctx.lineTo(centerX + 160 * Math.cos(angle), centerY + 160 * Math.sin(angle));
                ctx.lineWidth = 10;
                ctx.strokeStyle = '#ff0000';
                ctx.stroke();
            }

            Connections {
                target: speedReceiver
                onSpeedValueChanged: {
                    speedpointer.requestPaint()
                }
            }
        }




        Rectangle {
                id: background
                width: parent.width
                height: parent.height
                color: "black"
        }





        Image {
            id: gearImage
            width: 300
            height: 300
            scale: 3
            x : parent.width / 2 - width / 2
            y : parent.height / 2 - width / 2
            //        anchors {
            //            bottom: parent.bottom
            //            horizontalCenter: parent.horizontalCenter
            //            margins: parent.height /2 - height /2
            //        }

            source: "image/volk.png" // Replace with the path to your image
        }
}



