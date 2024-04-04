import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    FontLoader {
        id: titillFont
        source: "qrc:/amarulasolutions.com/imports/Fonts/Titillium_Web/TitilliumWeb-Regular.ttf"
    }
    TextField
    {
        id:textfield
        anchors.centerIn: parent
        width:Math.min(parent.width*0.7,300)
        height: parent.height*0.2
        color: "white"
        font.pixelSize: parent.height*0.1
        font.family: titillFont.name
        inputMethodHints: Qt.ImhDigitsOnly
        background: Item {
            implicitWidth: 200
            implicitHeight: 40
            Rectangle
            {
                id:botomline
                width:parent.width
                height:1
                anchors.bottom: parent.bottom
                color:"#afafb1"
            }
            Rectangle
            {
                width:parent.width*((textfield.activeFocus)?1.0:0.4)
                Behavior on width { SmoothedAnimation { velocity: 200 } }
                height:4
                anchors.verticalCenter: botomline.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"#afafb1"
                radius:Math.min(width,height);
                visible:textfield.enabled
            }
        }
    }
}

