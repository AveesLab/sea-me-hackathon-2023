import QtQuick 2.7
import QtQuick.Controls 2.2
import com.yourcompany.acceloutput 1.0
import com.yourcompany.orderoutput 1.0
import com.yourcompany.rpmoutput 1.0
import "."
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: screen.width
    height: screen.height
    property alias gearImage: gearImage
    property int bState: 0
    property bool showWeather: false
    property bool showWarn: false
    property bool showStar: false
    title: qsTr("Speedometer")

    // Background Image
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "image/back.png" // Replace with the path to your background image
    }
    // Arc Image
    Image {
        id: arcImage
        width: 590
        height: 590
        anchors.verticalCenterOffset: -175
        anchors.horizontalCenterOffset: -548
        anchors.centerIn: parent
        source: "image/dial.png" // Replace with the path to your arc image
    }
    Image {
        id: rpmImage
        width: 550
        height: 550
        anchors.verticalCenterOffset: -185
        anchors.horizontalCenterOffset: 527
        anchors.centerIn: parent
        source: "image/rpm.png" // Replace with the path to your arc image
    }
    // Car Image
    Image {
        id: carImage
        y: -484
        width: 412 // Adjust the width of the car image
        height: 299
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 185 // Adjust the height of the car image
        source: "image/car1.png" // Replace with the path to your car image
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
    }
    Image {
        id: weatherIcon
        width: 166
        height: 166
        anchors.verticalCenterOffset: -46
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        source: weatherAPI.weatherIcon
        visible: showWeather
    }
    Image {
        id: warnIcon
        width: 864
        height: 80
        anchors.verticalCenterOffset: -506
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        source: "image/warning.png"
        visible: showWarn
    }
    Timer {
        id: blinkTimer
        interval: 500 // Blink every 500ms
        running: false // Don't start running automatically
        repeat: true
        onTriggered: {
            warnIcon.visible = !warnIcon.visible // Toggle visibility
        }
    }
    Image {
        id: starIcon
        width: 80
        height: 80
        anchors.verticalCenterOffset: -506
        anchors.horizontalCenterOffset: -548
        anchors.centerIn: parent
        source: "image/star.png"
        visible: showStar
    }

    Text {
        id: temperature
        font.pixelSize: 40
        font.bold: true
        font.italic: true
        color: 'white'
        anchors.horizontalCenter: weatherIcon.horizontalCenter
        anchors.top: weatherIcon.bottom
        anchors.topMargin: -40
        text: weatherAPI.temperature + "°C"
        anchors.horizontalCenterOffset: 1
        visible: showWeather
    }

    Canvas {
        id: canvas
        width: parent.width
        height: parent.height
        anchors.verticalCenterOffset: -170
        anchors.horizontalCenterOffset: -548
        rotation: 180
        anchors.centerIn: parent
        onPaint: {
            var ctx = getContext('2d');
            var centerX = width / 2;
            var centerY = height / 2;

            // Clear the canvas
            ctx.clearRect(0, 0, width, height);

            // Draw the speed bar
            var angle = (accelOutput.accelValue - 35) * Math.PI / 180; // Use the dialValue from accelOutput
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(centerX + 160 * Math.cos(angle), centerY + 160 * Math.sin(angle));
            ctx.lineWidth = 10;
            ctx.strokeStyle = '#ff0000';
            ctx.stroke();
        }

        Connections {
            target: accelOutput
            onAccelValueChanged: {
                canvas.requestPaint()
            }
        }
    }

    Canvas {
        id: canvas1
        width: parent.width
        height: parent.height
        anchors.verticalCenterOffset: -185
        anchors.horizontalCenterOffset: 527
        rotation: 180
        anchors.centerIn: parent
        onPaint: {
            var ctx = getContext('2d');
            var centerX = width / 2;
            var centerY = height / 2;

            // Clear the canvas
            ctx.clearRect(0, 0, width, height);

            // Draw the speed bar
            var angle = (rpmOutput.rpmValue - 45) * Math.PI / 180;
            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(centerX + 135 * Math.cos(angle), centerY + 135 * Math.sin(angle));
            ctx.lineWidth = 7;
            ctx.strokeStyle = '#ff0000';
            ctx.stroke();
        }

        Connections {
            target: rpmOutput
            onRpmValueChanged: {
                canvas1.requestPaint()
            }
        }
    }
    Row {
        anchors.verticalCenterOffset: 486
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        spacing: 10

        Text {
            id: pText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "P"
            color: 'red'
        }

        Text {
            id: rText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "R"
            color: 'white'
        }

        Text {
            id: nText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "N"
            color: 'white'
        }

        Text {
            id: dText
            font.pixelSize: 130
            font.italic: true
            font.bold: true
            text: "D"
            color: 'white'
        }

        Connections {
            target: orderOutput
            onOrderValueChanged: {
                if (orderOutput.orderValue >= 0 && orderOutput.orderValue <= 3) {
                    bState = orderOutput.orderValue;
                    pText.color = bState === 0 ? 'red' : 'white';
                    rText.color = bState === 1 ? 'red' : 'white';
                    nText.color = bState === 2 ? 'red' : 'white';
                    dText.color = bState === 3 ? 'red' : 'white';

                    gearImage.visible = bState === 0;
                    videoOutput.visible = bState === 1;
                }
                else if(orderOutput.orderValue === 4){
                    showWeather = !showWeather;
                    weatherAPI.requestWeather("Seoul");
                }
                else if(orderOutput.orderValue === 5){
                    if (showWarn) {
                        blinkTimer.stop(); // Stop blinking
                        warnIcon.visible = false; // Ensure the icon is hidden
                    } else {
                        blinkTimer.start(); // Start blinking
                    }
                    showWarn = !showWarn;
                }
                else if(orderOutput.orderValue === 6){
                    showStar = !showStar;
                }
            }
        }

    }

    Image {
        id: gearImage
        width: 450
        height: 450
        scale: 1
        anchors.verticalCenterOffset: -334
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        source: "image/volk.png" // Replace with the path to your image
        visible: bState === 0
    }

    Camera {
        id: camera
        deviceId: "/dev/video1"
    }

    VideoOutput {
        id: videoOutput
        width: 492 // Set width of the camera output
        height: 441
        anchors.verticalCenterOffset: -334
        anchors.horizontalCenterOffset: 0 // Set height of the camera output
        anchors.horizontalCenter: parent.horizontalCenter // Center the output horizontally
        anchors.verticalCenter: parent.verticalCenter // Center the output vertically
        source: camera
        visible: bState === 1
    }
}
