import resourceManager from '@ohos.resourceManager';
import { common } from '@kit.AbilityKit';
import {MenuModel ,MenuModelData} from '../model/MenuModel';
import util from '@ohos.util';
import buffer from '@ohos.buffer';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  @State Menulist :Array<MenuModelData>=[];

  aboutToAppear() {
    let mContext=getContext() as  common.UIAbilityContext;
    this.getjson(mContext);
  }

  async getjson(context :common.UIAbilityContext){
    let getjson=await context.resourceManager.getRawFileContent('menuData.json');

    let textDecoderOptions: util.TextDecoderOptions = { ignoreBOM : true }
    let textDecoder = util.TextDecoder.create("utf-8",textDecoderOptions);
    let result =textDecoder.decodeWithStream(getjson,{ stream:false });
    console.log(result)

    let menumodel:MenuModel=JSON.parse(result);
    this.Menulist=menumodel.data;

  }

  build() {

    List({space:10}){
      ForEach(this.Menulist,(item:MenuModelData)=>{
        ListItem(){
          Flex({ direction: FlexDirection.Row }) {
            Image(item?.pic)
              .width(100)
              .height(100)
              .objectFit(ImageFit.Fill)
              .borderRadius(5.0) //圆角需要float类型

            Flex({ direction: FlexDirection.Column,justifyContent:FlexAlign.SpaceBetween }){
              Flex({ direction: FlexDirection.Column }){
                Text(item?.name)
                  .fontSize(18)
                  .fontColor(Color.Black)
                  .textAlign(TextAlign.Start)
                Text(item?.content)
                  .fontColor(Color.Gray)
                  .fontSize(15)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }

              Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){
                Text(item?.cookingtime)
                  .fontSize(13)
                  .fontColor(Color.Gray)
                  .textAlign(TextAlign.Start)

                Button("查看")
                  .height(16)
                  .width(50)
              }
            }
            .margin({left:10})
            .height(100)
          }
          .padding({left:10,right:10})
        }
      })
    }
  }
}

export default Index;