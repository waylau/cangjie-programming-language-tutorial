package kv_store


import std.sync.*
import std.collection.*

public interface KeyValue {
    func set(key: String, value: String): Unit

    func get(key: String): Option<String>
}

class KeyValueStore <: KeyValue {
    let mtx: ReentrantMutex
    var store: HashMap<String, String>

    public init() {
        this.mtx = ReentrantMutex()
        this.store = HashMap<String, String>()
    }

    public func set(key: String, value: String): Unit {
        // 操作前加锁
        mtx.lock()

        this.store.put(key, value)

        // 操作后解锁
        mtx.unlock()
    }

    public func get(key: String): Option<String> {
        return this.store.get(key)
    }
}

