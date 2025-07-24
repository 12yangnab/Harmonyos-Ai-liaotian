// dengluPage.ets
@Entry
@Component
struct DengluPage {
  build() {
    Column({ space: 32 }) {
      //logo图片
      Image($r('app.media.ailogo'))
        .width(120)
        .height(120)
        .margin({ top: 100 })

      // 1. 标题
      Text('长大·智能小助手')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 80 })

      // 2.手机号登录按钮部分
      Row() {
        Image($r('app.media.phone'))
          .width(20)
          .height(20)
          .fillColor(Color.White)      // 让图标变白色
        Blank()                       // 图标与文字之间自动撑开
        Text('手机号登录')
          .fontSize(16)
          .fontColor('#FFFFFF')
        Blank()                       // 右侧撑开，保证文字居中
      }
      .width('80%')
      .height(48)
      .backgroundColor('#ff000409')
      .borderRadius(24)
      .padding({ left: 16, right: 16 }) // 左右各留 16 vp 内边距
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        // TODO: 手机号登录逻辑
      })
      // 3. 账号密码登录
      Row() {
        Image($r('app.media.mima'))
          .width(20)
          .height(20)
          .fillColor(Color.Black)      // 让图标变白色
        Blank()                       // 图标与文字之间自动撑开
        Text('账号密码登录')
          .fontSize(16)
          .fontColor('#ff070000')
        Blank()                       // 右侧撑开，保证文字居中
      }
      .width('80%')
      .height(48)
      .backgroundColor('#fffafbfc')
      .borderRadius(24)
      .padding({ left: 16, right: 16 }) // 左右各留 16 vp 内边距
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        // TODO: 密码登录逻辑
      })

      // 4. 撑开剩余空间
      Blank()

      // 5. 固定在底部的协议
      Row() {
        Checkbox({ name: 'agree' })
        Text('已阅读并同意此软件的服务协议和隐私政策')
          .fontSize(12)
          .fontColor('#ff110000')
          .margin({ left: 8 })
      }
      .width('80%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 24 })   // 距离底部一点点空隙
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffbebaba')
  }
}