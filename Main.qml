import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 360
    title: "Dashboard UI"
    id:root


    Rectangle {
        width: parent.width
        height: parent.height
        color: "#33373F"
        focus: true

        Keys.onReleased: {
            handleKeyRelease(event)  // Call the function with the explicit event parameter
        }

        function handleKeyRelease(event) {
            myVehicle.handleKeyPress(event.key); // send key to C++
        }

        // Logo and ECO MODE Indicator
        Image {
            //id: name
            source: "qrc:/icon.PNG"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 15
            height: 25
            width: 25
        }

        Rectangle {
        width: myText.width
        height: 35
        radius: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 80
        color: "#292D34"

            Text {
                id:myText
                text: myVehicle.text
                anchors.centerIn: parent
                color: (myVehicle.text === "Battery temperature high. Contact Service Center") ? "red"
                     : (myVehicle.text === "REVERSE") ? "yellow"
                     : (myVehicle.text === "HANDBRAKE") ? "red"
                     : (myVehicle.text === "BRAKE FLUID LOW") ? "red"
                     : "#00FF00"
                font.pixelSize: 20
            }

        }

        //Arc to simulate the gauge using Canvas
                    Canvas {
                        id: gaugeCanvas
                        width: 420
                        height: 420

                        anchors.centerIn: parent

                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);

                            // Draw the outer arc
                            ctx.beginPath();
                            ctx.arc(width / 2, height, width / 2 - 20, Math.PI, 2 * Math.PI, false);
                            ctx.lineWidth = 20;
                            ctx.strokeStyle = "grey";
                            ctx.stroke();
                        }
                    }

        // Speedometer
        Rectangle {
            width: 200
            height: 600
            anchors.centerIn: parent
            color: "transparent"

            Text {
                text: myVehicle.speed
                color: (myVehicle.text === "REVERSE") ? "yellow" : "white"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 110
                font.bold: true
            }

            Text {
                text: "km/h"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 90
                color: "white"
                font.pixelSize: 18
            }
        }

        // Vehicle Temperature section
        Column {
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.verticalCenter: parent.verticalCenter
            spacing: 20

            Text {
                text: "Vehicle Temperature"
                color: "lightgrey"
                font.pixelSize: 22
            }

            Row {
                spacing: 10
                Image {
                    source: "qrc:/battery_grey.PNG"  // Use appropriate icons here
                    width: 20
                    height: 13
                }
                Rectangle {
                    width: 100
                    height: 12
                    color: "#444444"
                    radius: 6
                    Rectangle {
                        radius: 6
                        width: myVehicle.progressBar
                        height: 5
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 4
                        color: "red"
                    }
                }
            }
            Row {
                spacing: 10
                Image {
                    source: "qrc:/engine.PNG"  // Use appropriate icons here
                    width: 20
                    height: 13
                }
                Rectangle {
                    width: 100
                    height: 12
                    color: "#444444"
                    radius: 6
                    Rectangle {
                        radius: 6
                        width: 30
                        height: 5
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 4
                        color: "red"
                    }
                }
            }
            Row {
                spacing: 10
                Image {
                    source: "qrc:/controller.PNG"  // Use appropriate icons here
                    width: 20
                    height: 13
                }
                Rectangle {
                    width: 100
                    height: 12
                    color: "#444444"
                    radius: 6
                    Rectangle {
                        radius: 6
                        width: 50
                        height: 5
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 4
                        color: "red"
                    }
                }
            }
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            spacing: 15
            Rectangle {
                width: 200
                height: 30
                radius: 5
                color: "#24282D"

                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    spacing: 10
                    Text {
                        text: "TTC "
                        color: "grey"
                        font.pointSize: 14
                    }
                    Text {
                        text: "5 Hours"
                        color: "white"
                        font.pointSize: 14
                    }
                }
            }
            Rectangle {
                width: 200
                height: 30
                radius: 5
                color: "#24282D"

                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text {
                        text: "Odo "
                        color: "grey"
                        font.pointSize: 14
                    }
                    Text {
                        text: "18,500 KM"
                        color: "white"
                        font.pointSize: 14
                    }
                }
            }
            Rectangle {
                width: 200
                height: 30
                radius: 5
                color: "#24282D"

                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text {
                        text: "DTE  "
                        color: "grey"
                        font.pointSize: 14
                    }
                    Text {
                        text: "120 KM"
                        color: "white"
                        font.pointSize: 14
                    }
                }
            }
        }


        // Battery Level
        Text {
            id: yash
            text: qsTr("140V")
            color: "white"
            font.pointSize: 13
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 66
            anchors.left: parent.left
            anchors.leftMargin: 400
        }

        Image {
            id: myImage
            source: "qrc:/battery_grey.PNG"
            width: 20
            height: 13
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            anchors.left: parent.left
            anchors.leftMargin: 450
        }

        Rectangle {
            width: parent.width * 0.3
            height: 15
            color: "#333333"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            radius: 7
            Rectangle {
                //width: parent.width * 0.9
                width: myVehicle.batteryIndicator
                height: parent.height
                anchors.leftMargin: 7
                color: (myVehicle.text === "Battery temperature high. Contact Service Center") ? "red"
                     : (myVehicle.text === "REVERSE") ? "#00FF00"
                     : (myVehicle.text === "BRAKE FLUID LOW") ? "red"
                     : "#00FF00"
                radius: 7
            }

            Text {
                text: myVehicle.hundredText
                anchors.right: parent.right
                //color: "white"
                color: (myVehicle.text === "BRAKE FLUID LOW") ? "red" : "white"
                font.pixelSize: 14
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 10
            }
        }

        // Arrow Button

        Image {
            id: rightArrow
            source: "qrc:right_arrow.PNG"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
        }
    }
}
