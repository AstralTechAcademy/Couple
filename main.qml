/***************************************
* 
*  Couple App 
*  Astral Tech 2023
*
***************************************/
import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Layouts


Window 
{
  id: mMainWindow
  visible: true
  height: Screen.height
  width: Screen.width
  //visibility: "FullScreen"
  color: "#e9e7e7"
  title: qsTr("Couple")

  Item
  {
    id: header

    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    height: mMainWindow.height * 0.05 // 5% of the windows height

    Image
    {
      id: logo
      // use the group name and the alias of the image defined in qml.qrc
      source: "qrc:/assets/Logo"
      // This attribute resize the image to keep the aspect ratio
      fillMode: Image.PreserveAspectFit
      // Fix the image in the center of the window
      anchors.horizontalCenter: parent.horizontalCenter
      // The height of the image fills the header height
      height: parent.height
    }
  }

  Item
  {
    id: body
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.bottom: footer.top
    anchors.bottomMargin: 0
    anchors.top: header.bottom
    anchors.topMargin: 0

    Rectangle
    {
      anchors.fill: parent
      color: "lightblue"
    }
  }

  Item
  {
    id: footer
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    height: mMainWindow.height * 0.05 // 5% of the windows height
    Rectangle
    {
      anchors.fill: parent
      color: "yellow"
    }
  }
}