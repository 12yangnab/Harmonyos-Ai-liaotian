@Entry
@Component
export default struct aiPage {
  @State isShow:boolean = false;
  @State inputValue:string = "";
  build() {
    Column() {
      //顶部标题栏
      Text("长大智能助手")
        .backgroundColor("#15A783")
        .width("100%")
        .height(45)
        .textAlign(TextAlign.Center)
        .fontSize(18)
        .fontColor(Color.White)
        .fontWeight(800)

      //中间内容
      Column(){
        //聊天内容
        Row(){
          //左边
          Column() {
            Image($r("app.media.ChatGPT"))
              .height(40)
              .width(40)
              .fillColor('#15A783')
          }.height(50)
          //中间
          Column(){
            Text("2025-07-28")
              .fontSize(12)
              .fontColor("#888888")
            Text("您好，我是您的ai小助手，请问有什么可以帮您的111111111111111111111111")
              .backgroundColor(Color.White)
              .fontSize(14)
              .padding(5)
              .borderRadius(5)
          }.layoutWeight(1)

          //右边
          Column().width(50)
        }.width("100%")
        .alignItems(VerticalAlign.Top)
      }.backgroundColor("#ececec")
      .padding(5)
      .layoutWeight(1)
      .width("100%")
      //底部输入框
      Row(){
        TextInput({placeholder:"请输入您的问题",text:$$this.inputValue})
          .layoutWeight(1)
        if (this.inputValue.trim().length>0){
          Row(){Image($r("app.media.plan"))
            .height(30)
          }.justifyContent(FlexAlign.Center)
          .width(70)
          .height(45)
          .borderWidth(1)
          .borderRadius(30)
          .linearGradient({
            angle:45,
            colors:[["#B18DF7",0],["8C76F5",1]]
          })
          .stateStyles({
            //点击动画效果
            normal:{//初始状态
              .scale({x:1,y:1})
              .opacity(1)
            },
            pressed:{//点击状态
              .scale({x:0.9,y:0.8})
              .opacity(0.8)
            }
          })
        }

      }.width("100%")
      .height(50)
      .padding({left:5,right:5})

    }.width("100%")
    .height("100%")
  }

}