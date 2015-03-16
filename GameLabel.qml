import QtQuick 2.0
import Ubuntu.Components 1.1

Item {
    property var game;

    anchors.leftMargin: units.gu(30) * (game.round - 2)

    TeamLabel {
        id: topTeam
        game: parent.game
        isTop: true
    }

    TeamLabel {
        id: bottomTeam
        anchors.top: topTeam.bottom
        game: parent.game
    }
}
