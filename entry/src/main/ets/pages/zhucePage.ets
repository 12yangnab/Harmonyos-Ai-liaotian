import { promptAction } from '@kit.ArkUI';
import { http } from '@kit.NetworkKit';
import { router } from '@kit.ArkUI';
import ServerResponseDataType from '../mould/ServerResponseDataType';


@Entry
@Component
struct ZhucePage {
  @State account: string = '';
  @State password: string = '';
  @State firmPassword: string = '';
  @State telephone: string = '';

  build() {
    Column() {
      //标题栏
      Stack({ alignContent: Alignment.Start }) {
        Text("账号注册")
          .fontColor(Color.White)
          .width("100%")
          .height(45)
          .backgroundColor("#0FA37F")
          .textAlign(TextAlign.Center)
          .fontWeight(800)
        Row() {
          Image($r("app.media.arrow"))
            .height(20)
          Text("返回")
            .fontColor(Color.White)
        }

      }.width("100%")
      /*
      *白色的盒子
       */
      Column() {
        Row({ space: 10 }) {
          Text("用户名")
            .textAlign(TextAlign.Start)
            .width(70)
          TextInput({ placeholder: "请输入用户名", text: $$this.account })
            .placeholderFont({
              size: 12,
            })
            .borderRadius(0)
            .backgroundColor(Color.White)
            .padding({ left: 5, right: 5 })
        }
        .width("100%")
        .height(50)
        .borderWidth({ bottom: 1 })
        Row({ space: 10 }) {
          Text("密码")
            .textAlign(TextAlign.Start)
            .width(70)
          TextInput({ placeholder: "请输入密码", text: $$this.password })
            .placeholderFont({
              size: 12,
            })
            .borderRadius(0)
            .backgroundColor(Color.White)
            .padding({ left: 5, right: 5 })
        }
        .width("100%")
        .height(50)
        .borderWidth({ bottom: 1 })
        Row({ space: 10 }) {
          Text("确认密码")
            .width(70)
            .textAlign(TextAlign.Start)
          TextInput({ placeholder: "请确认密码", text: $$this.firmPassword })
            .padding({ left: 5, right: 5 })
            .placeholderFont({
              size: 12,
            })
            .borderRadius(0)
            .layoutWeight(1)
            .backgroundColor(Color.White)
        }
        .height(50)
        .borderWidth({ bottom: 1 })

        Row({ space: 10 }) {
          Text("手机号")
            .width(70)
            .textAlign(TextAlign.Start)
          TextInput({ placeholder: "请输入手机号", text: $$this.telephone })
            .padding({ left: 5, right: 5 })
            .placeholderFont({
              size: 12,
            })
            .borderRadius(0)
            .backgroundColor(Color.White)
        }
        .height(50)
        .borderWidth({ bottom: 1 })

        Button("保存")
          .backgroundColor("#0FA37F")
          .width("90%")
          .margin({ top: 20 })
          .onClick(async () => {
            //1.校验数据
            if (this.account.trim().length <= 0) {
              promptAction.showToast({
                message: "用户名不能为空"
              })
            }
            if (this.password.trim().length <= 0) {
              promptAction.showToast({
                message: "密码不能为空"
              })
            }
            if (this.firmPassword.trim().length <= 0) {
              promptAction.showToast({
                message: "请确认您的密码"
              })
            }
            if (this.telephone.trim().length <= 0) {
              promptAction.showToast({
                message: "手机号不能为空"
              })
            }
            if (this.password.trim() !== this.firmPassword.trim()) {
              promptAction.showToast({
                message: "两次密码不一致"
              })
            }

            //将数据发送到服务器进行保存
            //2.1创建请求对象
            let httpRequest = http.createHttp();
            //2.2服务器的地址
            let u = "http://www.softeem.xin:9898/userInfo/register"
            try {
              //2.3发送请求
              let response = await httpRequest.request(u, {
                //确定请求方式，这里我们用post请求，还有get,delete,put
                method: http.RequestMethod.POST,
                //传输到服务器的参数
                extraData: {
                  account: this.account,
                  password: this.password,
                  telephone: this.telephone
                },
                //如果是post请求，我们还要设置我们的请求头
                header: {
                  "Content-Type": "application/json"
                }
              });

              //将json字符串转化成我们的对象来操作
              let result = JSON.parse(response.result as string) as ServerResponseDataType;

              //注册成功
              if (result.code === 0) {
                await promptAction.showToast({
                  message: "注册成功"
                })
              } else if (result.code === 1) {
                promptAction.showDialog({
                  title:"注册成功",
                  message:"快去登录把",
                  buttons:[{
                    text:"好的",
                    color:"#00000"
                  }]
                }).then((ret) => {
                  if (ret.index === 0) {        // 点击了“好的”
                    router.replaceUrl({ url: 'pages/dengluPage' }); // 或 pushUrl
                  }
                });
              }
              promptAction.showDialog({
                message: response.result + ""
              })
            } catch (e) {
              promptAction.showToast({
                message: "注册失败"
              })
            }
          })
      }.width("100%")
      .padding({ left: 20, right: 20 })
      .height("300")
      .backgroundColor(Color.White) .borderRadius(12)
    }.width("100%")
    .height("100%")
    .backgroundColor("#ECECEC")

  }
}