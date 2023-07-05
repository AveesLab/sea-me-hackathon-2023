import QtQuick 2.7
import QtQuick.Controls 2.2
import com.yourcompany.accel 1.0
import com.yourcompany.order 1.0
import com.yourcompany.rpm 1.0

ApplicationWindow {
    visible: true
    width: 1280
    height: 960
    title: qsTr("Controller")

    property int clickedButton: 0
    property int clickedimgButton: 0

    Accel {
        id: accel
    }

    Order {
        id: order
    }

    Rpm {
        id: rpm
    }

    Slider {
        id: scrollBar
        width: 631
        height: 219
        rotation: 270
        anchors.verticalCenterOffset: -26
        anchors.horizontalCenterOffset: -236
        from: 0
        to: 100
        value: 0

        onValueChanged: {
            accel.adjustAccelSize(scrollBar.value);
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
        to: 100
        value: 0

        onValueChanged: {
            rpm.adjustRpmSize(rpmBar.value);
        }

        anchors.centerIn: parent
    }

    Column {
        id: orderButtons
        anchors.centerIn: parent
        spacing: 10

        Button {
            id: orderButton0
            text: "P"
            onClicked: {
                order.adjustOrder(0);
                clickedButton = 0;
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
                text: orderButton0.text
                color: clickedButton === 0 ? "red" : "white"
                font.pointSize: 40
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: orderButton1
            text: "R"
            onClicked: {
                order.adjustOrder(1);
                clickedButton = 1;
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
                text: orderButton1.text
                color: clickedButton === 1 ? "red" : "white"
                font.pointSize: 40
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: orderButton2
            text: "N"
            onClicked: {
                order.adjustOrder(2);
                clickedButton = 2;
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
                text: orderButton2.text
                color: clickedButton === 2 ? "red" : "white"
                font.bold: true
                font.pointSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: orderButton3
            text: "D"
            onClicked: {
                order.adjustOrder(3);
                clickedButton = 3;
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
                text: orderButton3.text
                color: clickedButton === 3 ? "red" : "white"
                font.bold: true
                font.pointSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
    Button {
        id: weatherButton
        property bool isToggled: false
        x: 354
        y: 826 // Add this line

        onClicked: {
            order.adjustOrder(4);
            isToggled = !isToggled; // This line toggles the state
        }
        width: 100
        height: 100

        contentItem: Image {
            id: weatherImage
            width: 100
            height: 100
            source: weatherButton.isToggled ? "image/weather1.png" : "image/weather.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    Button {
        id: warnButton
        property bool isToggled: false
        x: 590
        y: 826 // Add this line

        onClicked: {
            order.adjustOrder(5);
            isToggled = !isToggled; // This line toggles the state
        }
        width: 100
        height: 100

        contentItem: Image {
            id: warnImage
            width: 100
            height: 100
            source: warnButton.isToggled ? "image/warn.png" : "image/warn1.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    Button {
        id: starButton
        property bool isToggled: false
        x: 771
        y: 816 // Add this line

        onClicked: {
            order.adjustOrder(6);
            isToggled = !isToggled; // This line toggles the state
        }
        width: 200
        height: 120

        contentItem: Image {
            id: starImage
            width: 100
            height: 100
            source: starButton.isToggled ? "image/on.png" : "image/off.png" // Use the state here
        }

        background: Rectangle {
            color: "transparent"
        }
    }
    TextEdit {
        id: textEdit
        x: 128
        y: 59
        width: 80
        height: 20
        font.pixelSize: 12
    }
}
