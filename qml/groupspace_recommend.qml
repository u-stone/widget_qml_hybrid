import QtQuick 2.7
import QtQuick.Controls 2.2
import CustomQml.Recommend 1.0

Item {
    height: recomment_model.rowCount() * 312
    width: 300

    ListView {
        id: listview
        anchors.fill: parent
        model: recomment_model
        delegate: RecommendCard {}
        cacheBuffer: parent.height * 2

        ScrollBar.vertical: ScrollBar {  }
    }
}
