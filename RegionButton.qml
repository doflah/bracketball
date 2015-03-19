import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0

Label {
    property int region;

    height: parent.height / 2;
    width: parent.width / 2;
    text: main.regions[region]
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    fontSize: "x-large"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            main.n = region;
            PopupUtils.close(regionPickerDlg);
        }
    }
}
