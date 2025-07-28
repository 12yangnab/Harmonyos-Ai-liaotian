// liaotianPage.ets
@Entry
@Component
struct LiaotianPage {
  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
        Text('长大·智能小助手')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
      }
      .width('100%')
      .height(56)
      .backgroundColor('#00A575')
      .padding({ bottom: 1 })
      // .borderBottom({ width: 1, color: '#E0E0E0' })

      // 聊天内容区域
      Scroll() {
        Column({ space: 8 }) {
          // 消息1
          Row({ space: 8 }) {
            Column({ space: 4 }) {
              Text('您好，我是您的ai小助手，请问有什么可以帮您的')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ left: 16 })
            }
          }

          // 消息2
          Row({ space: 8 }) {
            Text('2025-07-18')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ left: 16 })
            Column({ space: 4 }) {
              Text('荆州今天的温度')
                .fontSize(14)
                .fontColor('#333366')
                .margin({ left: 16 })
            }
          }
        }
      }
      .width('100%')
      .flexGrow(1)
      .backgroundColor('#F5F5F5')

      // 输入框
      Row({ space: 8 }) {
        TextInput({ placeholder: '请输入消息' })
          .width('80%')
          .height(40)
          .borderRadius(20)
          .backgroundColor('#FFFFFF')
          .margin({ left: 8 })
        Button('发送')
          .width(60)
          .height(40)
          .backgroundColor('#007DFF')
          .fontColor('#FFFFFF')
          .borderRadius(20)
          .margin({ right: 16 })
      }
      .height(60)
      .backgroundColor('#FFFFFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}