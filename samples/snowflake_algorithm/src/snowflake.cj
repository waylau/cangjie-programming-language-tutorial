package snowflake_algorithm


import std.time.*
import std.sync.*

public class Snowflake {
    // 起始的时间戳(毫秒)，通常是系统上线的时间
    internal let twepoch: Int64 = 1725148800000

    // 机器ID所占的位数
    internal let workerIdBits: Int64 = 5

    // 数据中心ID所占的位数
    internal let datacenterIdBits: Int64 = 5

    // 最大机器ID
    internal let maxWorkerId: Int64 = -1 ^ (-1 << workerIdBits)

    // 最大数据中心ID
    internal let maxDatacenterId: Int64 = -1 ^ (-1 << datacenterIdBits)

    // 序列号所占的位数
    internal let sequenceBits: Int64 = 12

    // 机器ID左移位数
    internal let workerIdShift: Int64 = sequenceBits

    // 数据中心ID左移位数
    internal let datacenterIdShift: Int64 = sequenceBits + workerIdBits

    // 时间截左移位数
    internal let timestampLeftShift: Int64 = sequenceBits + workerIdBits + datacenterIdBits

    // 序列号掩码
    internal let sequenceMask: Int64 = -1 ^ (-1 << sequenceBits)

    // 工作机器ID
    internal let workerId: Int64

    // 数据中心ID
    internal let datacenterId: Int64

    // 同一毫秒内的序列号
    internal var sequence: Int64 = 0

    // 上次生成ID的时间戳
    internal var lastTimestamp: Int64 = -1

    /**
     * 构造函数，初始化工作机器ID和数据中心ID。
     *
     * @param workerId 工作机器ID
     * @param datacenterId 数据中心ID
     */
    public init(workerId: Int64, datacenterId: Int64) {
        if (workerId > maxWorkerId || workerId < 0) {
            throw IllegalArgumentException("workerId can't be greater than ${maxWorkerId} or less than 0")
        }

        if (datacenterId > maxDatacenterId || datacenterId < 0) {
            throw IllegalArgumentException("datacenterId can't be greater than ${maxWorkerId} or less than 0")
        }

        this.workerId = workerId
        this.datacenterId = datacenterId
    }

    let mtx = ReentrantMutex()

    /**
     * 生成下一个ID
     *
     * @return 下一个ID
     */
    public func nextId() {
        synchronized(mtx) {
            var timestamp = timeGen()

            if (timestamp < lastTimestamp) {
                throw IllegalStateException(
                    "Clock moved backwards. Refusing to generate id for ${lastTimestamp - timestamp} milliseconds")
            }

            if (lastTimestamp == timestamp) {
                sequence = (sequence + 1) & sequenceMask

                if (sequence == 0) {
                    timestamp = tilNextMillis(lastTimestamp)
                }
            } else {
                sequence = 0
            }

            lastTimestamp = timestamp

            ((timestamp - twepoch) << timestampLeftShift) | (datacenterId << datacenterIdShift) | (workerId <<
                workerIdShift) | sequence
        }
    }

    /**
     * 阻塞到下一个毫秒，直到获得新的时间戳
     *
     * @param lastTimestamp 上次生成ID的时间截
     * @return 当前时间戳
     */
    internal func tilNextMillis(lastTimestamp: Int64) {
        var timestamp = timeGen()

        while (timestamp <= lastTimestamp) {
            timestamp = timeGen()
        }

        timestamp
    }

    /**
     * 返回以毫秒为单位的当前时间
     *
     * @return 当前时间(毫秒)
     */
    internal func timeGen() {
        DateTime.nowUTC().toUnixTimeStamp().toMilliseconds()
    }
}
