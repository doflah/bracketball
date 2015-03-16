import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    id: main
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "bracketball.doflah"

    automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(50)
    height: units.gu(75)

    property var tournament;

    Page {
        title: i18n.tr("Bracketball")

        Flickable {
            anchors.fill: parent
            contentHeight: 16 * units.gu(5)
            contentWidth: 4 * units.gu(30)
            Repeater {
                model: new Array(15)
                delegate: GameLabel {
                    anchors.topMargin: units.gu(index < 8 ? index * 10 : index < 12 ? (index - 8) * 20 : index < 14 ? (index - 12) * 40 : 0)
                    anchors.left: parent.left
                    anchors.top: parent.top
                    game: getGame(tournament, index < 8 ? 201 + index : index < 12 ? 301 + index - 8 : index < 14 ? 401 + index - 12 : 501)
                }
            }
        }
    }

    function getGame(t, g) {
        if (t && t.length > 0) {
            for (var i = 0; i < t.length; i++) {
                if (+t[i].bracketPositionId === g) {
                    return (t[i]);
                }
            }
        }
        return {
            "contestId": 0,
            "bracketPositionId": "0",
            "away": {

                        "score":"",
                        "names": {
                            "full": "",
                            "short": "",
                            "seo": "",
                            "char6": "",
                            "char8": "",
                            "char10": ""
                        },
                        "description":"",
                        "iconURL":"",
                        "radioUrl":"",
                        "isTop":"T",
                        "winner":"false"

            },
            "currentPeriod":"",
            "finalMessage":"",
            "gameDate": "",
            "gameDateShort": "",
            "startTime":"",
            "startTimeShort":"",
            "startTimeEpoch":"",
            "gameState":"",
            "home": {

                        "score":"",
                        "names": {
                            "full": "",
                            "short": "",
                            "seo": "",
                            "char6": "",
                            "char8": "",
                            "char10": ""
                        },
                        "description":"",
                        "iconURL":"",
                        "radioUrl":"",
                        "isTop":"F",
                        "winner":"false"

            },
            "timeclock":"",
            "round":"",
            "location": "",
            "network":"",
            "url":"",
            "liveStatsEnabled": "",
            "previewUrl": "",
            "watchLiveUrl":"",
            "gameCenterUrl": "",
            "externalStatsUrl": "",
            "liveVideoExternalUrl": "",
            "nationalRadioUrl": "",
            "boxScoreUrl": "",
            "recapUrl": "",
            "highlightUrl":"",
            "ticketsUrl":"",
            "seedTop": "",
            "seedBottom": "",
            "textOverrideTop":null,
            "textOverrideBottom":null
        }
    }

    Component.onCompleted: {
        var xhr = new XMLHttpRequest();
        xhr.open("GET",
                 "http://data.ncaa.com/jsonp/gametool/brackets/championships/basketball-men/d1/2014/data.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var str = xhr.responseText.replace("callbackWrapper(", "");
                main.tournament = JSON.parse(str.substring(0, str.length - 2)).games;
            }
        };
        xhr.send();
    }
}

