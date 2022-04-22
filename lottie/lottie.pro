# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

TEMPLATE = subdirs

SUBDIRS += bin
SUBDIRS += lib
SUBDIRS += tests/unit

QMLTEST {
    SUBDIRS += tests/qml
}

bin.depends = lib
tests/unit.depends = lib
tests/unit.qml = lib
