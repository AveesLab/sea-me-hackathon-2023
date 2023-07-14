import QtQuick 2.7
import QtQuick.Controls 2.2
import com.seame.Speed 1.0
import com.seame.Buttons 1.0
import com.seame.RPM 1.0
import com.seame.FuelEff 1.0
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: 1280
    height: 960
    title: qsTr("Controller")

    property string clickedButton: "P"
    property bool isLeftToggled: false
    property bool isRightToggled: false
    property bool isWarnToggled: false
    property bool isEngineToggled: false
    property bool isFuelToggled: false
    property bool isEngineTempToggled: false

    Speed {
        id: speed
    }

    Buttons {
        id: buttons
    }

    RPM {
        id: rpm
    }

    FuelEff {
        id: fueleff
    }

    Slider {
        id: speedBar
        width: 631
        height: 219
        rotation: 270
        anchors.verticalCenterOffset: -26
        anchors.horizontalCenterOffset: -236
        from: 0
        to: isEngineToggled ? 260 : 0
        value: 0
        

        onValueChanged: {
           if(isEngineToggled){
                speed.adjustSpeed(speedBar.value);
            }
        }

        anchors.centerIn: parent
    }

    Slider {
        id: rpmBar
        width: 631
        height: 219
        rotation: 270
        anchors.verticalCenterOffset: -26
        anchors.horizontalCenterOffset: 231
        from: 0
        to: isEngineToggled ? 8000 : 0
        value: 0

        onValueChanged: {
           if(isEngineToggled){
                rpm.adjustRPM(rpmBar.value);
           }
        }

        anchors.centerIn: parent
    }
    Slider {
        id: fuelEffBar
        width: 631
        height: 219
        rotation: 270
        anchors.verticalCenterOffset: -26
        anchors.horizontalCenterOffset: -500
        from: 0
        to: isEngineToggled ? 20 : 0
        value: 0

        onValueChanged: {
           if(isEngineToggled){
                fueleff.adjustFuelEff(fuelEffBar.value);
            }
        }

        anchors.centerIn: parent
    }

    Column {
        id: orderButtons
        anchors.centerIn: parent
        spacing: 10

        Button {
            id: buttonP
            text: "P"
            onClicked: {
                if(isEngineToggled) {
                    buttons.adjustButtons("P");
                    clickedButton = "P";
                }
            }
            width: 100
            height: 100
            font.pixelSize: 40
            font.bold: true
            background: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "gray" }
                }
            }
            contentItem: Text {
                text: buttonP.text
                color: clickedButton === "P" && isEngineToggled ? "red" : "white"
                font.pointSize: 40
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: buttonR
            text: "R"
            onClicked: {
                if(isEngineToggled) {
                    buttons.adjustButtons("R");
                    clickedButton = "R";
                }
            }
            width: 100
            height: 100
            font.pixelSize: 40
            font.bold: true
            background: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "gray" }
                }
            }
            contentItem: Text {
                text: buttonR.text
                color: clickedButton === "R" && isEngineToggled ? "red" : "white"
                font.pointSize: 40
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: buttonN
            text: "N"
            onClicked: {
                if(isEngineToggled) {
                    buttons.adjustButtons("N");
                    clickedButton = "N";
                }
            }
            width: 100
            height: 100
            font.pixelSize: 40
            font.bold: true
            background: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "gray" }
                }
            }
            contentItem: Text {
                text: buttonN.text
                color: clickedButton === "N" && isEngineToggled ? "red" : "white"
                font.bold: true
                font.pointSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: buttonD
            text: "D"
            onClicked: {
                if(isEngineToggled) {
                    buttons.adjustButtons("D");
                    clickedButton = "D";
                }
            }
            width: 100
            height: 100
            font.pixelSize: 40
            font.bold: true
            background: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "gray" }
                }
            }
            contentItem: Text {
                text: buttonD.text
                color: clickedButton === "D" && isEngineToggled ? "red" : "white"
                font.bold: true
                font.pointSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: buttonS
            text: "S"
            onClicked: {
                if(isEngineToggled){
                    buttons.adjustButtons("S");
                    clickedButton = "S";
                }
            }
            width: 100
            height: 100
            font.pixelSize: 40
            font.bold: true
            background: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "gray" }
                }
            }
            contentItem: Text {
                text: buttonS.text
                color: clickedButton === "S" && isEngineToggled ? "red" : "white"
                font.bold: true
                font.pointSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
    Button {
        id: buttonWeather
        property bool isToggled: false
        x: 354
        y: 826 // Add this line

        onClicked: {
            if(isEngineToggled) {
                buttons.adjustButtons("Weather");
                isToggled = !isToggled; // This line toggles the state
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: weatherImage
            width: 100
            height: 100
            source: buttonWeather.isToggled && isEngineToggled ? "image/weather1.png" : "image/weather.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    Button {
        id: buttonWarn
        x: 590
        y: 826 // Add this line

        onClicked: {
            if(isEngineToggled){
                buttons.adjustButtons("Warn");
                isWarnToggled = !isWarnToggled; // This line toggles the state
                isRightToggled = false;
                isLeftToggled = false;
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: warnImage
            width: 100
            height: 100
            source: isWarnToggled && isEngineToggled ? "image/warn.png" : "image/warn1.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }

    Button {
        id: buttonleft
        x: 154
        y: 826 // Add this line

        onClicked: {
            if(isEngineToggled) {
                buttons.adjustButtons("Left");
                isLeftToggled = !isLeftToggled; // This line toggles the state
                isRightToggled = false;
                isWarnToggled = false;
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: leftImage
            width: 100
            height: 100
            source: isLeftToggled && isEngineToggled ? "image/left.png" : "image/left1.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }

    Button {
        id: buttonright
        x: 1020
        y: 826 // Add this line

        onClicked: {
            if(isEngineToggled){
                buttons.adjustButtons("Right");
                isRightToggled = !isRightToggled; // This line toggles the state
                isLeftToggled = false;
                isWarnToggled = false;
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: rightImage
            width: 100
            height: 100
            source: isRightToggled && isEngineToggled ? "image/right.png" : "image/right1.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }

    Button {
        id: buttonLight
        property bool isToggled: false
        x: 771
        y: 816 // Add this line

        onClicked: {
            if(isEngineToggled){
                buttons.adjustButtons("Light");
                isToggled = !isToggled; // This line toggles the state
            }
        }
        width: 200
        height: 120

        contentItem: Image {
            id: starImage
            width: 100
            height: 100
            source: buttonLight.isToggled && isEngineToggled ? "image/on.png" : "image/off.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }

    Button {
        id: buttonEngine
        x: 590
        y: 50 // Add this line

        onClicked: {
            if(clickedButton == "P" && speedBar.value == 0 && rpmBar.value == 0){
                // This line toggles the state
                buttons.adjustButtons("Engine");
                isEngineToggled = !isEngineToggled;
                start_sound.play();
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: engineImage
            width: 100
            height: 100
            source: isEngineToggled ? "image/engine_start.png" : "image/engine_stop.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    Button {
        id: buttonFuel
        x: 1170
        y: 10 // Add this line

        onClicked: {
            if(isEngineToggled && !isFuelToggled){
                buttons.adjustButtons("Fuel");
                isFuelToggled = !isFuelToggled; // This line toggles the state
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: fuelImage
            width: 100
            height: 100
            
            source: "image/fuel.png"
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    
    Button {
        id: buttonTempEngine
        x: 10
        y: 10 // Add this line

        onClicked: {
            if(isEngineToggled && !isEngineTempToggled){
                buttons.adjustButtons("Temp");
                isEngineTempToggled = !isEngineTempToggled; // This line toggles the state
            }
        }
        width: 100
        height: 100

        contentItem: Image {
            id: tempImage
            width: 100
            height: 100
            
            source: "image/enginetemp.png"
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    Text {
        id: text1
        x: 350
        y: 91
        text: qsTr("Speed")
        font.bold: true
        font.pixelSize: 36
    }

    Text {
        id: text2
        x: 831
        y: 91
        text: qsTr("RPM")
        font.bold: true
        font.pixelSize: 36
    }
    Audio{
        id:start_sound
        source:"image/start_sound.mp3"
    }
}
