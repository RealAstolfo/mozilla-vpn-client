/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import { Client } from './Client'
import { GenericDispatcher } from './genericdispatcher'

const MAX_REQUEST_COUNT = 50
class _NetworkObserver extends GenericDispatcher {
  counter: number
  requests: Array<object>

  constructor () {
    super()
    Client.on('network', (e) => this.onIncomingRequest(e.detail))
    this.counter = 0
    this.requests = []
  }

  onIncomingRequest (networkRequest) {
    const { request, response } = networkRequest
    request.url = new URL(request.url)
    this.counter++
    this.requests.push({ id: this.counter, request, response })
    if (this.requests.length > MAX_REQUEST_COUNT) {
      this.requests.shift()
    }
    this.emit({ type: 'update', list: this.requests })
  }

  get (id) {
    return this.requests[id]
  }
  start() {
    console.log('Start network Recording');
    Client.sendCommand('fetch_network');
  }
}

export const NetworkObserver = new _NetworkObserver()
