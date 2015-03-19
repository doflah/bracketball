import QtQuick 2.0
import Ubuntu.Components 1.1

Item {
    property var game;
    property bool leftBracket: false;

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: leftBracket ? units.gu(30) * (game.round - 2) : units.gu(30) * (5 - game.round)

    TeamLabel {
        id: topTeam
        game: parent.game
        isTop: true
        isLeft: leftBracket
    }

    TeamLabel {
        id: bottomTeam
        anchors.top: topTeam.bottom
        game: parent.game
        isLeft: leftBracket
    }

}
