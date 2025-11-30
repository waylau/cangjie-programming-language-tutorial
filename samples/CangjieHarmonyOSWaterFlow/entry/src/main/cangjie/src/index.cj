package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos_app_cangjie_entry.component.column.*
import std.sync.Timer
import std.time.Duration
import ohos_app_cangjie_entry.event.*

@Entry
@Component
class IndexView {

    let eventBus = EventBus()

    var timer: Option<Timer> = Option<Timer>.None

    func clearTimer(): Option<Duration> {
        this.timer = Option<Timer>.None
        nativeLog("500毫秒以后解锁")
        return Option<Duration>.None
    }

    func onScroll(e: OffsetResult) {
        if (let None <- this.timer) {
            if (e.yOffset >= 180.0) {
                nativeLog("scrolled y: ${e.yOffset}")
                this.eventBus.emit("scrolled")
                this.timer = Timer.after(Duration.millisecond * 300, this.clearTimer)
            }
        }
    }

    func build() {
        Scroll() {
            Row(5) {
                WaterColumn(eventBus: eventBus)

                WaterColumn(eventBus: eventBus)
            }.padding(5)
            .alignItems(VerticalAlign.Top)
        }.scrollable(ScrollDirection.Vertical)
        .onScroll(onScroll)
        .height(100.percent)
        .backgroundColor(0xe7e8eb)
    }
}
