import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

Page {
    id: root

    property var myStackView

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

    Image {
        anchors.fill: parent

        source: "qrc:/qt/qml/RR/img/background_page1.png"

        fillMode: Image.PreserveAspectCrop
    }

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
        MAIN CONTENT
    */

    ScrollView {
        id: mainScrollView
        anchors.fill: parent
        anchors.topMargin: button_back.height + 20
        clip: true

        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.horizontal.policy: ScrollBar.AsNeeded

        // Задаємо розмір зони прокрутки чітко по контенту з полями
        contentWidth: boardGrid.implicitWidth + 60
        contentHeight: contentLayout.implicitHeight + 60

        Item {
            id: contentWrapper

            width: mainScrollView.contentWidth
            height: mainScrollView.contentHeight


            x: {
                let netFreeSpace = mainScrollView.availableWidth - boardGrid.implicitWidth

                if (netFreeSpace > 60) {

                    return (netFreeSpace / 2) - 30
                } else {

                    return 0
                }
            }

            y: {
                let netFreeHeight = mainScrollView.availableHeight - contentLayout.implicitHeight
                if (netFreeHeight > 60) {

                    return (netFreeHeight / 2) - 30
                } else {
                    return 0
                }
            }

            ColumnLayout {
                id: contentLayout
                spacing: 40
                width: boardGrid.implicitWidth

                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 30
                anchors.leftMargin: 30


                Grid {
                    id: boardGrid
                    columns: formController.boardWidth
                    spacing: 1
                    Layout.alignment: Qt.AlignHCenter

                    Repeater {
                        model: formController.boardModel
                        delegate: Rectangle {
                            width: 35
                            height: 35
                            border.width: 1
                            border.color: "#444"
                            color: modelData === 1 ? "black" : "white"
                        }
                    }
                }

                Rectangle {
                    id: lable_page1
                    visible: formController.solveStatus !== ""
                    anchors.centerIn: parent
                    z: 999

                    width: Math.max(360, root.width * 0.3)
                    height: Math.max(70, root.height * 0.1)
                    radius: 12
                    color: "white"

                    Text {
                        text: formController.solveStatus
                        font.bold: true
                        anchors.centerIn: parent
                        font.pixelSize: parent.width * 0.06
                        color: "black"
                    }

                    layer.enabled: true
                    layer.effect: MultiEffect {
                        shadowEnabled: true
                        shadowBlur: 0.9
                        shadowVerticalOffset: 6
                        shadowColor: "#80000000"
                    }
                }
            }
        }
    }
}