import QtQuick 2.0
import Ubuntu.Components 1.1

Item {

    property var game;
    property bool isTop: false
    property bool isLeft: true

    property var team: ((game.away.isTop === "T" && isTop) || (game.away.isTop === "F" && !isTop)) ? game.away : game.home

    anchors.top: parent.top
    width: units.gu(30)
    height: units.gu(5) * Math.pow(2, game.round - 2)

    // lines connecting the brackets
    Rectangle {
        color: "black"
        height: 1
        width: parent.width
        anchors.top: teamName.bottom
    }

    Rectangle {
        visible: isTop
        color: "black"
        width: 1
        anchors.right: isLeft ? parent.right: undefined
        anchors.left: isLeft ? undefined: parent.left
        anchors.top: teamName.bottom
        anchors.bottom: parent.bottom
    }

    Rectangle {
        visible: !isTop
        color: "black"
        width: 1
        anchors.right: isLeft ? parent.right: undefined
        anchors.left: isLeft ? undefined: parent.left
        anchors.top: parent.top
        anchors.bottom: teamName.bottom
    }

    // seed, logo, name, score
    Label {
        id: seed
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: units.gu(2)
        text: isTop ? game.seedTop : game.seedBottom;
        horizontalAlignment: Text.AlignRight
    }

    Image {
        id: logo
        anchors.left: seed.right
        anchors.leftMargin: units.gu(1)
        anchors.verticalCenter: parent.verticalCenter
        height: units.gu(5)
        width: height
        visible: game.away.names.short !== ""
        source: team.iconURL ? "http://i.turner.ncaa.com/dr/ncaa/ncaa/release/" +  team.iconURL : ""
    }

    Icon {
        anchors.left: seed.right
        anchors.leftMargin: units.gu(1)
        anchors.verticalCenter: parent.verticalCenter
        height: units.gu(4)
        width: height
        visible: !logo.visible
        name: "help"
    }

    Label {
        id: teamName
        anchors.left: seed.right
        anchors.leftMargin: units.gu(6)
        anchors.verticalCenter: parent.verticalCenter

        font.bold: game.gameState === "final" && team.winner === "true"
        text: team.names.short + "   " +  team.score
    }

}
