package ohos_app_cangjie_entry.event

import std.collection.*

public class EventBus {
    let callbackMap = HashMap<String, ArrayList<() -> Unit>>([])

    public func on(eventName: String, callback: () -> Unit) {
        let optionArr = callbackMap.get(eventName)

        if (let Some(arr) <- optionArr) {
            arr.append(callback)
        } else {
            let arr = ArrayList<() -> Unit>([callback])
            callbackMap.put(eventName, arr)
        }
    }

    public func emit(eventName: String) {
        let optionArr = callbackMap.get(eventName)

        if (let Some(arr) <- optionArr) {
            var callback: () -> Unit
            for (callback in arr) {
                callback()
            }
        }
    }
}

