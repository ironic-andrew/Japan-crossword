/*
import QtQuick
import QtQuick.Controls


ApplicationWindow {
    visible: true
    width: 800
    height: 600





    StackView {
        id: stack
        anchors.fill: parent

        initialItem: Qt.resolvedUrl("gallery.qml")
    }


    Text {
        text: "HELLO QML"
        anchors.centerIn: parent
    }


}
*/


import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: "Японські кросворди"

    Image {
        anchors.fill: parent
        source: "qrc:/qt/qml/RR/img/background_main.png"
        fillMode: Image.PreserveAspectCrop
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Item {

            GridLayout {
                anchors.centerIn: parent
                rowSpacing: 20
                columns: 1

                GridLayout {
                    columns: 2
                    rowSpacing: 30

                    TextField {
                        id: rCountInput

                        color: "black"

                        property bool hasError: false

                        placeholderText: "Кількість стовпців"
                        inputMethodHints: Qt.ImhDigitsOnly
                        placeholderTextColor: "gray"

                        onTextChanged: hasError = false

                        background: Rectangle {
                                radius: 6
                                border.width: 2
                                border.color: rCountInput.hasError ? "red" : "#cccccc"
                                color: "white"
                            }
                    }

                    TextField {
                        id: fCountInput

                        color: "black"

                        property bool hasError: false

                        placeholderText: "Кількість рядків"
                        inputMethodHints: Qt.ImhDigitsOnly
                        placeholderTextColor: "gray"

                        onTextChanged: hasError = false

                        background: Rectangle {
                                radius: 6
                                border.width: 2
                                border.color: fCountInput.hasError ? "red" : "#cccccc"
                                color: "white"
                            }
                    }

            }

                Item {

                    Layout.alignment: Qt.AlignHCenter

                    width: button.width
                    height: button.height

                    MultiEffect {
                        source: button

                        anchors.fill: button

                        shadowEnabled: true
                        shadowBlur: 0.9
                        shadowVerticalOffset: 6
                        shadowColor: "#80000000"
                    }

                    Rectangle {
                    id: button

                    property color baseColor: "white"
                    property color hoverColor: "#BEBEBE"

                    width: Math.max(160, root.width * 0.1)
                    height: Math.max(50, root.height * 0.05)

                    radius: 12
                    color: baseColor

                    Text {

                        text: "Підтвердити"
                        anchors.centerIn: parent
                        font.pixelSize: parent.width * 0.1
                        font.bold: true

                    }

                    Behavior on color {
                            ColorAnimation {
                                duration: 150
                            }
                        }

                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true

                                onEntered: {
                                    button.color = button.hoverColor
                                }

                                onExited: {
                                    button.color = button.baseColor
                                }

                        onPressed: {button.color = "#C3CDE6"

                            let r = parseInt(rCountInput.text)
                            let f = parseInt(fCountInput.text)


                            let valid = true

                                // Check R
                                if (rCountInput.text === "" || isNaN(r) || r <= 0) {
                                    rCountInput.hasError = true
                                    valid = false
                                }

                                // Check F
                                if (fCountInput.text === "" || isNaN(f) || f <= 0 ){
                                    fCountInput.hasError = true
                                    valid = false
                                }

                                if (!valid) {
                                    console.log("Введи коректні числа")
                                    return
                                }


                                formController.build(r, f)


                                stackView.push("Page2.qml", {
                                    myStackView: stackView
                                })
                        }

                        onReleased: button.color = button.baseColor
                    }
                }


                }

            }

            }

            GridLayout {
                columns: 4
                columnSpacing: 10
                rowSpacing: 10

                Repeater {
                    model: formController.model

                    delegate: TextField {
                        placeholderText: modelData.type + (modelData.index + 1)

                        text: modelData.value

                        onTextChanged: {
                            modelData.value = text
                        }
                    }
                }
            }
        }
    }