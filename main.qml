import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1

ApplicationWindow {
    property string appTitle: "Example"

    id: window
    // visible: true
    width: 640
    height: 480
    title: qsTr(appTitle)

    SystemTrayIcon {
        id: systray
        tooltip: qsTr("Example")
        visible: true
        icon.source: "qrc:/favicon.ico"

        menu: Menu {
            MenuItem {
                text: qsTr("Change Icon")
                onTriggered: {
                    systray.icon.source = "qrc:/favicon_full.ico"
                    systray.showMessage("Message title", "Something important came up. Click this to know more.")
                }
            }
            MenuItem {
                text: qsTr("Quit")
                onTriggered: {
                    Qt.quit()
                }
            }
        }

        onMessageClicked: {
            console.log("Message clicked")
            window.show()
        }
        Component.onCompleted: {
            console.log(supportsMessages)
            console.log(Qt.locale().name);

        }

        onActivated: {
            console.log(reason)
            if(reason === SystemTrayIcon.DoubleClick) {
                window.show()
                window.raise()
                window.requestActivate()
            }
        }
    }

    onClosing: {
        window.hide()
    }

}
