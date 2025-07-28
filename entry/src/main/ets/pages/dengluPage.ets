import { router } from '@kit.ArkUI'

// loginPage.ets
@Entry
@Component
struct dengluPage {
  @State userName: string = ''
  @State password: string  = ''
  @State rememberPwd: boolean = false

  build() {
    Column({ space: 20 }) {
      // 返回按钮
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 12 })
        Text('返回')
          .fontSize(14)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      // 标题
      Text('登录')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 32 })

      // 用户名
      TextInput({ placeholder: '请输入用户名', text: this.userName })
        .width('90%')
        .height(50)
        .borderRadius(8)
        .backgroundColor('#F5F5F5')
        .onChange(v => this.userName = v)

      // 密码
      TextInput({ placeholder: '请输入密码', text: this.password })
        .type(InputType.Password)
        .width('90%')
        .height(50)
        .borderRadius(8)
        .backgroundColor('#F5F5F5')
        .onChange(v => this.password = v)

      // 记住密码
      Row() {
        Checkbox({ name: 'remember', group: 'g1' })
          .select(this.rememberPwd)
          .onChange(v => this.rememberPwd = v)
        Text('记住密码')
          .fontSize(14)
          .margin({ left: 8 })
      }
      .width('90%')
      .justifyContent(FlexAlign.Start)

      // 登录按钮
      Button('登录')
        .width('90%')
        .height(50)
        .backgroundColor('#ff00ff7b')
        .fontColor('#FFFFFF')
        .borderRadius(8)
        .onClick(() => {
          // TODO: 登录逻辑
          router.pushUrl({url:'pages/aiPage'})
        })

      // 注册
      Row() {
        Text('还没有账号，')
          .fontSize(14)
          .fontColor('#666666')
        Text('去注册')
          .fontSize(14)
          .fontColor('#007DFF')
          .onClick(() => {
            // TODO: 跳转注册
            console.info("跳转注册页面")
            router.pushUrl({url:'pages/zhucePage'})
          })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}