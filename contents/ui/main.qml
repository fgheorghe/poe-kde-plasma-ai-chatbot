import QtQuick 2.12
import QtWebEngine 1.8
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.12
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQml 2.12


Item {
    id: widget
    Plasmoid.backgroundHints: PlasmaCore.Types.StandardBackground | PlasmaCore.Types.ConfigurableBackground

    Layout.preferredWidth: 400
    Layout.preferredHeight: 200


    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    Plasmoid.fullRepresentation: RowLayout {
        WebEngineView {
            id: webview
            url: "https://poe.com/"
            anchors.fill: parent

            onLoadingChanged: function (loadRequest) {
                if (loadRequest.status === 2) {
                    runJavaScript("window.document.styleSheets[0].insertRule('* { transform: scale(0.99); }', 0);")
                }
            }
        }
    }
}


