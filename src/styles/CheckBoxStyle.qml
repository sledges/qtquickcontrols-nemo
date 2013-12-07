/****************************************************************************************
**
** Copyright (C) 2013 Aleksi Suomalainen <suomalainen.aleksi@gmail.com>
** All rights reserved.
**
** You may use this file under the terms of BSD license as follows:
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**     * Redistributions of source code must retain the above copyright
**       notice, this list of conditions and the following disclaimer.
**     * Redistributions in binary form must reproduce the above copyright
**       notice, this list of conditions and the following disclaimer in the
**       documentation and/or other materials provided with the distribution.
**     * Neither the name of the author nor the
**       names of its contributors may be used to endorse or promote products
**       derived from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
** ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************************/

import QtQuick 2.1
import QtQuick.Controls.Styles 1.0
//Styles.Nemo provides Theme
import QtQuick.Controls.Styles.Nemo 1.0

CheckBoxStyle {
    indicator: Rectangle {
            id: background
            color: "transparent"
            implicitWidth: 72
            implicitHeight: 32

            Rectangle {
                id: back1
                implicitWidth: 72
                implicitHeight: 28
                color: Theme.checkbox.back1
                anchors.centerIn: parent
            }

            Rectangle {
                id: back2
                implicitWidth: 72
                implicitHeight: 28
                color: Theme.checkbox.back2
                anchors.centerIn: parent
            }

            Image {
                id: ball
                source: "images/switch-slider.png"
                anchors.verticalCenter: parent.verticalCenter
                height: 35
                x: -5
            }

            Connections {
                target: control
                onCheckedChanged: {
                    if (control.checked) {
                        anim1.restart()
                    } else {
                        anim2.restart()
                    }

                }
            }

            SequentialAnimation {
                id: anim1
                running: false
                NumberAnimation {
                    target: ball
                    property: "x"
                    to: 45
                    duration: 120
                }
                NumberAnimation {
                    target: back1
                    property: "opacity"
                    to: 1
                    duration: 60
                }
                NumberAnimation {
                    target: back2
                    property: "opacity"
                    to: 0
                    duration: 60
                }
            }

            SequentialAnimation {
                id: anim2
                running: false
                NumberAnimation {
                    target: ball
                    property: "x"
                    to: -10
                    duration: 120
                }
                NumberAnimation {
                    target: back2
                    property: "opacity"
                    to: 1
                    duration: 60
                }
                NumberAnimation {
                    target: back1
                    property: "opacity"
                    to: 0
                    duration: 60
                }
            }
    }
}
