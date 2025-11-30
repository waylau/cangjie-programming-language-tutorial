package ohos_app_cangjie_entry.component.column

import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos_app_cangjie_entry.mock.*
import ohos_app_cangjie_entry.component.card.*
import ohos_app_cangjie_entry.event.*

const GAP = 5;

@Component
public class WaterColumn {

    @Prop var eventBus: EventBus

    @State var dataList: ObservedArrayList<MockData> = ObservedArrayList<MockData>([])

    func addData() {
        dataList.appendAll(mockData())
    }

    protected override func aboutToAppear() {
        this.addData()
        this.eventBus.on("scrolled", this.addData)
        return
    }

    func build() {
        Column() {
            List() {
                ForEach(dataList, itemGeneratorFunc: { e: MockData, i: Int64 =>
                    ListItem() {
                        CoverCard(mediaType: e.mediaType, title: e.title, desc: e.desc)
                    }.margin(bottom: GAP)
                }, keyGeneratorFunc: { e: MockData, i: Int64 => e.noId.toString()})
            }
        }.layoutWeight(1)
        .justifyContent(FlexAlign.Start)
    }
}