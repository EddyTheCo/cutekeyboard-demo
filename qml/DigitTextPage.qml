import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {

    CustomTextField
    {
        id:textfield
        anchors.centerIn: parent
        width:Math.min(parent.width*0.7,300)
        font.pixelSize: parent.height*0.1
        inputMethodHints: Qt.ImhDigitsOnly
    }
}

