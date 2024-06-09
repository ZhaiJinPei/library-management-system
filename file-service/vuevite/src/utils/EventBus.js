// [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
//
// This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
//
// Copyright (c) 2024-present, Zhai JinPei

// eventBus.js
export default class EventBus {
    constructor() {
        this.events = {};
    }

    dispatch(eventName, data) {
        if (this.events[eventName]) {
            this.events[eventName].forEach(function (fn) {
                fn(data);
            });
        }
    }

    _on(eventName, fn) {
        this.events[eventName] = this.events[eventName] || [];
        this.events[eventName].push(fn);
    }

    _off(eventName, fn) {
        if (this.events[eventName]) {
            for (var i = 0; i < this.events[eventName].length; i++) {
                if (this.events[eventName][i] === fn) {
                    this.events[eventName].splice(i, 1);
                    break;
                }
            }
            ;
        }
    }
}

