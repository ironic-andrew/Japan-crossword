import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

Page {
    id: root

    Image {
        anchors.fill: parent
        source: "qrc:/qt/qml/RR/img/background_page2.png"
        fillMode: Image.PreserveAspectCrop
    }

    function validateGrid(grid) {
        let ok = true

        for (let i = 0; i < grid.children.length; i++) {
            let item = grid.children[i]

            if (!(item instanceof TextField))
                continue

            let value = parseInt(item.text)

            if (item.text === "" || isNaN(value) || value <= 0) {
                item.hasError = true
                ok = false
            }
        }

        return ok
    }

    function getValuesFromGrid(grid) {
        let result = []

        for (let i = 0; i < grid.children.length; i++) {
            let item = grid.children[i]

            if (item.text !== undefined) {
                result.push(item.text)
            }
        }

        return result
    }

    property var myStackView

    /*
        BACK BUTTON SHADOW
    */

    MultiEffect {
        source: button_back

        anchors.fill: button_back

        shadowEnabled: true
        shadowBlur: 0.9
        shadowVerticalOffset: 6
        shadowColor: "#80000000"
    }

    /*
        BACK BUTTON
    */

    Rectangle {
        id: button_back

        z: 100

        property color baseColor: "white"
        property color hoverColor: "#BEBEBE"

        width: Math.max(55, root.width * 0.08)
        height: width

        radius: 12

        color: baseColor

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10

        Image {
            anchors.centerIn: parent

            width: parent.width * 0.5
            height: width

            source: "qrc:/qt/qml/RR/img/back_arrow.png"
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
                button_back.color = button_back.hoverColor
            }

            onExited: {
                button_back.color = button_back.baseColor
            }

            onPressed: {
                button_back.color = "#C3CDE6"

                myStackView.pop()
            }

            onReleased: {
                button_back.color = button_back.baseColor
            }
        }
    }

    /*
        ScrollBar
    */

    ScrollView {
        anchors.fill: parent

        clip: true

        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        contentWidth: availableWidth

        ColumnLayout {
            width: root.width

            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 20

            Item {
                Layout.preferredHeight: 100
            }

            GridLayout {
                columns: 2
                columnSpacing: 40

                Layout.alignment: Qt.AlignHCenter

                //  LEFT - R
                GridLayout {
                    id: rGrid

                    columns: 2
                    rowSpacing: 10

                    Component.onCompleted: {
                        console.log("R MODEL SIZE:", formController.rModel.length)
                    }

                    Repeater {
                        model: formController.rModel

                        delegate: TextField {
                            id: field_r

                            Component.onCompleted: {
                                console.log("CREATED delegate", index)
                            }

                            color: "black"

                            Layout.preferredWidth: 180
                            Layout.preferredHeight: 20

                            property bool hasError: false

                            placeholderText: "Рядок " + (index + 1)
                            placeholderTextColor: "gray"

                            onTextChanged: {
                                hasError = false
                            }

                            background: Rectangle {
                                radius: 6
                                border.width: 2
                                border.color: field_r.hasError ? "red" : "#cccccc"
                                color: "white"
                            }
                        }
                    }
                }

                //  RIGHT - F
                GridLayout {
                    id: fGrid

                    columns: 2
                    rowSpacing: 10

                    Repeater {
                        model: formController.fModel

                        delegate: TextField {
                            id: field_f

                            color: "black"

                            Layout.preferredWidth: 180
                            Layout.preferredHeight: 20

                            property bool hasError: false

                            placeholderText: "Стовпець " + (index + 1)
                            placeholderTextColor: "gray"

                            onTextChanged: {
                                hasError = false
                            }

                            background: Rectangle {
                                radius: 6
                                border.width: 2
                                border.color: field_f.hasError ? "red" : "#cccccc"
                                color: "white"
                            }
                        }
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

                    anchors.centerIn: parent

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

                        onPressed: {
                            button.color = "#C3CDE6"

                            let rOk = validateGrid(rGrid)
                            let fOk = validateGrid(fGrid)

                            if (!rOk || !fOk) {
                                console.log("Є помилки у формах")
                                return
                            }

                            let r = getValuesFromGrid(rGrid)
                            let f = getValuesFromGrid(fGrid)

                            formController.processCounts(
                                r.length,
                                f.length,
                                r,
                                f
                            )

                            console.log("R:", r)
                            console.log("F:", f)

                            stackView.push("qrc:/qt/qml/RR/page1.qml", {
                                myStackView: stackView
                            })
                        }

                        onReleased: {
                            button.color = button.baseColor
                        }
                    }
                }
            }

            Item {
                Layout.preferredHeight: 40
            }
        }
    }
}