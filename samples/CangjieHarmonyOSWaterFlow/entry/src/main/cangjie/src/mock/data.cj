package ohos_app_cangjie_entry.mock

import ohos_app_cangjie_entry.entity.*
import std.collection.*
import std.random.*

let GLOBAL_RANDOM = Random()

public class ImageData {
    public ImageData(
        public var src: String,
        public var title: String,
        public var desc: String) {}
}

public class VideoData {
    public VideoData(
        public var src: String,
        public var preview: String,
        public var title: String,
        public var desc: String) {}
}

public class MockData {
    private static var nextNoId: Int64 = 0
    public var mediaType: MediaType
    public var title: String
    public var desc: String
    public var noId: Int64 = 0

    public init(mediaType: MediaType,title: String, desc: String) {
        this.mediaType = mediaType
        this.title = title
        this.desc = desc
        this.noId = nextNoId
        nextNoId ++
    }

    public init(imageData: ImageData) {
        this(MediaType.IMAGE(imageData.src), imageData.title, imageData.desc)
    }

    public init(videoData: VideoData) {
        this(MediaType.VIDEO((videoData.src, videoData.preview)), videoData.title, videoData.desc)
    }

    public init(mockData: MockData) {
        this(mockData.mediaType, mockData.title, mockData.desc)
    }
}

// 图片卡片的数据源
let mockImageDataList = [
    ImageData(
        "https://www-file.huawei.com/-/media/corp2020/technologies/publications/202401/2/8-2.jpg",
        "多模态带来训练数据指数级增长",
        "随着大模型从NLP走向多模态，原始训练数据集和数据训料从纯文本变成了文本、视图、图片和语音的混合，大模型训练所依赖的数据量呈指数级增长，膨胀程度达到万倍规模"
    ),
    ImageData(
        "https://www-file.huawei.com/-/media/corp2020/technologies/publications/202401/2/8-4.jpg",
        "AI数据湖解决方案",
        "AI数据湖解决方案，旨在帮助客户解决在部署实施AI大模型训练数据基础设施中所碰到的问题，让客户更加聚焦于其自身的大模型开发和训练。"
    ),
    ImageData(
        "https://e.huawei.com/topic/sitecore/2022-digital-cities/img/europe//p5.jpg",
        "西班牙bonÀrea Agrupa",
        "数据中心网络全面升级，按下数字化转型加速键"
    ),
    ImageData(
        "https://e.huawei.com/topic/sitecore/2022-digital-cities/img/europe//p6.jpg",
        "德国Asklepios医疗集团",
        "防患于未然，数据长存无忧"
    ),
    ImageData(
        "https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/pdp/phones/mate-xt-ultimate-design/images/design/colour-red-2x.webp",
        "从容驭世，雅致臻品",
        "瑞红，高雅华贵，大气恢弘，于掌间尽显气质"
    ),
    ImageData(
        "https://e.huawei.com/mediafileebg/MediaFiles/A/E/D/%7BAEDD0E9E-5659-4439-B94D-B8A40FBF1BC9%7Dshenzhen-second-experimental-school-smart-campus-img-2.jpg",
        "数字化教室",
        "IdeaHub Board 具备硬件防蓝光、便捷投屏、超低时延书写等多种功能，融合教学硬件及软件生态开展教学，加强师生互动，及时反馈，让课堂教学更加生动"
    ),
    ImageData(
        "https://e.huawei.com/topic/sitecore/2022-digital-cities/img/europe//p3.jpg",
        "意大利Perdepera度假村",
        "享受无处不在的优质网络"
    ),
    ImageData(
        "https://e.huawei.com/topic/sitecore/2022-digital-cities/img/europe//p4.jpg",
        "奥地利空管",
        "携手华为保证空中每一次安全飞行"
    ),
    ImageData(
        "https://www-file.huawei.com/-/media/corp2020/event/2024/5g-core-summit/5g-core-list.jpg",
        "2024年5G核心网峰会",
        "阿联酋 · 迪拜"
    ),
    ImageData(
        "https://www-file.huawei.com/-/media/corp2020/event/list/huawei-connect-2024-list-5.jpg",
        "华为全联接大会2024",
        "中国，上海"
    )
]

let mockVideoDataList = [
    VideoData(
        "https://e.huawei.com/topic/sitecore/2022-digital-cities/img/zhongdong/video-zhongdong.jpg",
        "https://e-file.huawei.com/mediares/Video_MCD/EBG/PUBLIC/zh/2022/11/202abd98-231f-419c-af4c-ac9ad7884d3c.mp4",
        "数字中东",
        "数智并举，点亮中东数字化转型之旅"
    ),
    VideoData(
        "https://www-file.huawei.com/-/media/corp2020/media-center/image/our-value2/cover-chinese.jpg",
        "https://www-file.huawei.com/-/media/corp2020/media-center/video3/prasa%20chinese%20corrected_1080.mp4",
        "铁路守护者",
        "百废待兴，驶向数字化“快车道”迫在眉睫。"
    ),
    VideoData(
        "https://res-static.hc-cdn.cn/cloudbu-site/china/zh-cn/GSL20221208/huaweiyunstackanli/guangdongnongxin/896x504(1.jpg",
        "https://res-video.hc-cdn.com/cloudbu-site/china/zh-cn/HuaweiCloudStack/jiaotongyinghang/jiaotongyinghang-tonghui.mp4",
        "交通银行",
        "深度构建湖仓一体的数据平台，交通银行实现高质量发展。"
    ),
    VideoData(
        "https://www-file.huawei.com/-/media/corp2020/images/tech4all/cases1/12/white-headed-langur-cv.jpg",
        "https://www-file.huawei.com/-/media/corp2020/videos/tech4all/stories/3/guangxi-white-headed-langer-cn-1080.mp4",
        "拯救白猴",
        "从悬崖到云端：AI开启白头叶猴保护新纪元"
    )
]

public func mockData() {
    var mockDataList = ArrayList<MockData>()
    var ind = 0
    for(_ in 0..10) {
        ind = GLOBAL_RANDOM.nextInt64() % mockImageDataList.size
        if (ind < 0) {
            ind += mockImageDataList.size
        }
        mockDataList.append(MockData(mockImageDataList[ind]))
    }

    return mockDataList.toArray()
}




