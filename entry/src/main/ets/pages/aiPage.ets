import { http } from "@kit.NetworkKit";
import ServerResponseDataType from "../mould/ServerResponseDataType";

interface MessageType{
  type:"System"|"User";
  time:string;
  content:string
}

@Entry
@Component
export default struct aiPage {
  @State isShow:boolean = false;
  @State inputValue:string = "";
  @State messageList:MessageType[] = [{
    type:"System",
    time:new Date().toLocaleTimeString(),
    content:"您好，我是长大智能助手，请问您有什么问题需要我帮助吗？",
  },{
    type:"User",
    time:new Date().toLocaleTimeString(),
    content:"帮忙开发app",
  }];

  //发送消息的方法
  private async  sendMessage(){
    //创建用户信息
    let msgUser:MessageType={
      type:"User",
      time:new Date().toLocaleTimeString(),
      content:this.inputValue,
    }
    //将用户信息添加到消息列表
    this.messageList.push(msgUser);
    //等待后台服务器回消息
    //创建请求对象
    let httpRequest = http.createHttp();
    //服务器地址
    let u="https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions"
    try {
    //发送请求
     let response = await httpRequest.request(u,{
       method:http.RequestMethod.POST,
       extraData:{
         content:this.inputValue
     },
     header:{
         "Content-Type" : "application/json"
     }
     });
     let result = JSON.parse(response.result as string) as ServerResponseDataType;
      if (result.code===0){
        //如果成功，把ai数据渲染到列表上
        //创建ai返回信息
        let msgAi:MessageType= {
          type:"System",
          time:new Date().toLocaleTimeString(),
          content:result.data.result
        }
        this.messageList.push(msgAi);
      }
    }catch (e) {
    }finally {
      this.isShow=false;
    }
  }
onPageShow(): void {
  this.getUIContext().setKeyboardAvoidMode(1)
}

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
     Scroll(){
       Column(){
         //聊天内容
         ForEach(this.messageList,(item:MessageType)=>{
           if(item.type=="System"){
             this.buildSystemMessage(item.time,item.content)
           }else if(item.type=="User"){
             this.buildUserMessage(item.time,item.content)
           }
         })

         if (this.isShow){
           Column(){
             LoadingProgress()
               .width(60)
               .height(60)
               .color("#15A783")
             Text("正在加载...")
               .fontColor("#888888")
               .fontSize(14)
           }
         }
         // this.buildSystemMessage()
         // this.buildUserMessage()
       }
       .width("100%")
     }.layoutWeight(1)
     .backgroundColor("#ececec")
      .align(Alignment.Top)
      .scrollBar(BarState.Off)

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
          .onClick(()=>{
            this.sendMessage();
            this.isShow=true;
          })
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

  @Builder
  buildUserMessage(time:string,content:string) {
    Row() {
      //左边
      Column().width(50);

      //中间
      Column({ space: 5 }) {
        Text(time)
          .fontSize(12)
          .fontColor("#888888");
        Text(content)
          .backgroundColor(Color.White)
          .fontSize(14)
          .padding(5)
          .borderRadius(5)
          .lineHeight(20)
      }.layoutWeight(1)
      .alignItems(HorizontalAlign.End);

      //右边
      Column() {
        Image($r("app.media.ChatGPT"))
          .height(40)
          .width(40)
          .fillColor('#15A783');
      }.height(50);
    }.width("100%")
    .alignItems(VerticalAlign.Top)
    .padding(5)
  }

  @Builder
  buildSystemMessage(time:string,content:string) {
    //聊天内容
    Row() {
      //左边
      Column() {
        Image($r("app.media.ChatGPT"))
          .height(40)
          .width(40)
          .fillColor('#15A783');
      }.height(50);

      //中间
      Column({space: 5}) {
        Text(time)
          .fontSize(12)
          .fontColor("#888888");
        Text(content)
          .backgroundColor(Color.White)
          .fontSize(14)
          .padding(5)
          .borderRadius(5)
          .lineHeight(20)
      }.layoutWeight(1)
      .alignItems(HorizontalAlign.Start);

      //右边
      Column().width(50);
    }.width("100%")
    .alignItems(VerticalAlign.Top)
    .padding(5)
  }
}