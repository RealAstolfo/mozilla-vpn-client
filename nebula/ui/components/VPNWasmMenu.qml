/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.5
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Window 2.12

import Mozilla.VPN 1.0

VPNFlickable {
    flickContentHeight: col.childrenRect.height + 100
    anchors.fill: parent

    Column {
        id: col

        spacing: 0
        width: parent.width * .83
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: VPNTheme.theme.rowHeight / 2

       VPNBoldLabel {
            id: viewsLabel

            text: "Views"
            font.pixelSize: VPNTheme.theme.windowMargin
            width: parent.width
            height: VPNTheme.theme.rowHeight
            leftPadding: 6
            verticalAlignment: Text.AlignVCenter

            Rectangle {
                height: 2
                width: parent.width
                color: "#eee"
                radius: 4
                anchors.bottom: parent.bottom
            }
        }

       VPNVerticalSpacer {
           height: VPNTheme.theme.windowMargin / 2
        }


        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Main"
            onClicked: mainStackView.replace("qrc:/ui/states/StateMain.qml", StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Mobile Onboarding"
            onClicked: mainStackView.replace("qrc:/ui/views/ViewMobileOnboarding.qml", StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Subscription Needed (IAP)"
            onClicked: mainStackView.replace("qrc:/ui/states/StateSubscriptionNeeded.qml", {wasmView: true}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Subscription Blocked (IAP)"
            onClicked: mainStackView.replace("qrc:/ui/states/StateSubscriptionBlocked.qml", {wasmView: true}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Billing not available (IAP) - Android"
            onClicked: mainStackView.replace("qrc:/ui/states/StateBillingNotAvailable.qml", {wasmView: true}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Subscription not validated (IAP) - Android"
            onClicked: mainStackView.replace("qrc:/ui/states/StateSubscriptionNotValidated.qml", {wasmView: true}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Device list: Max number of devices reached"
            onClicked: mainStackView.replace("qrc:/ui/views/ViewDevices.qml", {wasmView: true}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Update Required"
            onClicked: mainStackView.replace("qrc:/ui/views/ViewUpdate.qml", {state: "required"}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Update Recommended"
            onClicked: mainStackView.replace("qrc:/ui/views/ViewUpdate.qml", {state: "recommended"}, StackView.Immediate)
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Backend failure"
            onClicked: mainStackView.replace("qrc:/ui/states/StateBackendFailure.qml", StackView.Immediate)
        }

        // TODO
        /*
            -- Main ( VPN Connection Unstable )
            -- Main ( VPN No Connection)
        */

        VPNVerticalSpacer {
            height: VPNTheme.theme.windowMargin
         }

        VPNBoldLabel {
             text: "Other"
             font.pixelSize: 16
             width: parent.width
             height: VPNTheme.theme.rowHeight
             leftPadding: 6
             verticalAlignment: Text.AlignVCenter

             Rectangle {
                 height: 2
                 width: parent.width
                 color: "#eee"
                 radius: 4
                 anchors.bottom: parent.bottom
             }
         }

        VPNVerticalSpacer {
            height: VPNTheme.theme.windowMargin / 2
         }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Alerts"
            onClicked: mainStackView.replace("qrc:/nebula/components/VPNWasmAlerts.qml", StackView.Immediate)
        }

        VPNRemoveDevicePopup {
            z: 4
            id: popup
            deviceName: "<DevicName>"
        }

        VPNWasmMenuButton {
            Layout.fillWidth: true
            text: "Device list: device removal confirmation"
            onClicked: popup.open()
        }

    }
}
