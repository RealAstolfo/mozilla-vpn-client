/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#include "crashreporter.h"
#include <iostream>
#include "crashui.h"

using namespace std;

CrashReporter::CrashReporter(QObject* parent) : QObject(parent) {
  m_ui = make_unique<CrashUI>();
}

bool CrashReporter::shouldPromptUser() {
  // eventually this will need to check settings for an opt-in.  For now we
  // always ask
  return true;
}

void CrashReporter::crashReported(shared_ptr<CrashData> data) {
  cout << "Crash Reported." << endl;
  auto snapshot = createSnapshot(data);
  if (snapshot) {
    cout << "Snapshot received." << endl;
  }
  if (shouldPromptUser()) {
    promptUser();
  }
}

bool CrashReporter::promptUser() {
  m_ui->initialize();
  m_ui->showUI();
  return true;
}
