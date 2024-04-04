import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.CuteKeyboard 1.0
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

ApplicationWindow {
    id:window
    visible:true
    visibility: "FullScreen"
    background: Rectangle
    {
        color:"#1e1e1e"
    }

    title: qsTr("QtCuteKeyboard Demo")

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex
        anchors.horizontalCenter: parent.horizontalCenter
    }
    SwipeView {
        id: view

        currentIndex: 2
        onCurrentIndexChanged: inputPanel.state = ""
        anchors.top: indicator.bottom
        width:window.width
        height: inputPanel.y-indicator.height
        clip: true

        Landpage {
            id: landpage
            width:view.width
            height:view.height
        }
        NormalTextPage {
            id: normaltextpage
            width:view.width
            height:view.height
            onSelectedChanged: inputPanel.languageLayout=normaltextpage.selected
        }

        DigitTextPage {
            id: digittextpage
        }

    }
    InputPanel {
        id: inputPanel

        z: 99
        y: window.height
        anchors.left: parent.left
        anchors.right: parent.right
        languageLayout: "Es"

        states: State {
            name: "visible"
            when: Qt.inputMethod.visible

            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }

        }

        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true

            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 150
                    easing.type: Easing.InOutQuad
                }

            }

        }

    }

}
