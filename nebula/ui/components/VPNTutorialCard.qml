/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.15
import QtQuick.Layouts 1.15

import Mozilla.VPN 1.0

VPNCard {
    id: root

    property alias imageSrc: heroImage.source
    property alias imageBgColor: imageBg.color
    property alias cardTypeText: cardTypeText.text
    property alias title: titleText.text
    property alias description: descriptionText.text

    RowLayout {
        anchors.fill: parent

        spacing: VPNTheme.theme.windowMargin

        Rectangle {
            id: imageBg
            Layout.fillHeight: true
            Layout.preferredWidth: 112

            radius: root.radius

            //Used to get flat edges at the bottom of hero image background
            Rectangle {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                width: parent.radius
                color: parent.color
            }

            Image {
                id: heroImage

                anchors.centerIn: parent
                sourceSize.height: 80
                sourceSize.width: 80
            }
        }


        ColumnLayout {
            Layout.topMargin: 16
            Layout.rightMargin: 16
            Layout.bottomMargin: 8

            spacing: 0

            Text {
                id: cardTypeText

                Layout.fillWidth: true

                elide: Text.ElideRight
                font.pixelSize: VPNTheme.theme.fontSizeSmallest
                font.family: VPNTheme.theme.fontInterSemiBoldFamily
                lineHeightMode: Text.FixedHeight
                lineHeight: VPNTheme.theme.controllerInterLineHeight
                wrapMode: Text.WordWrap
                color: VPNTheme.theme.fontColorDark
                verticalAlignment: Text.AlignVCenter
                maximumLineCount: 1

                Accessible.role: Accessible.StaticText
                Accessible.name: text
            }

            VPNMetropolisLabel {
                id: titleText

                Layout.topMargin: VPNTheme.theme.listSpacing
                Layout.fillWidth: true

                font.family: VPNTheme.theme.fontBoldFamily
                lineHeight: 24
                color: VPNTheme.theme.fontColorDark
                horizontalAlignment: Text.AlignLeft
                maximumLineCount: 2
            }

            Text {
                id: descriptionText

                Layout.fillWidth: true
                Layout.fillHeight: true

                topPadding: 4
                elide: Text.ElideRight
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: VPNTheme.theme.fontSizeSmallest
                font.family: VPNTheme.theme.fontInterFamily
                lineHeightMode: Text.FixedHeight
                lineHeight: VPNTheme.theme.controllerInterLineHeight
                wrapMode: Text.WordWrap
                color: VPNTheme.theme.fontColor

                Accessible.role: Accessible.StaticText
                Accessible.name: text
            }
        }
    }
}
