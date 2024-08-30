import router from '@ohos.router';

import resourceManager from '@ohos.resourceManager';
import { common } from '@kit.AbilityKit';
import util from '@ohos.util';
import buffer from '@ohos.buffer';

import {Model, Category, Project} from '../model/Model'

@Entry
@Component
struct ClassPage {
  @State selectedCategory: Category = new Category();
  @State dataSource: Category[] = [];

  aboutToAppear(): void {
    let mContext=getContext() as  common.UIAbilityContext;
    this.getJson(mContext);
  }

  async getJson(context :common.UIAbilityContext){
    let json = await context.resourceManager.getRawFileContent('data.json');

    let textDecoderOptions: util.TextDecoderOptions = { ignoreBOM : true }
    let textDecoder = util.TextDecoder.create("utf-8", textDecoderOptions);
    let result = textDecoder.decodeWithStream(json, { stream:false });
    console.log(result)

    let model:Model = JSON.parse(result);
    this.dataSource = model.categories;
    this.selectedCategory = this.dataSource[0];
  }

  build() {

    Row() {
      List({ space: 10}) {
        ForEach(this.dataSource, (category: Category, index: number) => {
          ListItem() {
            Text(category.title)
              .fontSize(18)
              .fontWeight(this.selectedCategory.title == category.title? FontWeight.Bold : FontWeight.Normal)
              .padding(10)
              .height(60)
          }
          .width('100%')
          .backgroundColor(this.selectedCategory.title == category.title? 'white' : '#f1f1f1')
          .onClick(() => {
            this.selectedCategory = category;
          })
        }, (item: string) => item)
      }
      .width('30%')
      .height('100%')
      .backgroundColor('#f1f1f1')

      List({ space: 10 }) {
        ForEach(this.selectedCategory.projects, (project: Project, index: number) => {
          ListItem() {
            Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
              Image($r(project.icon)).width(80).aspectRatio(1) .margin({ right: 10 })
              Column() {
                Text(project.title)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                Text(project.description)
                  .fontSize(14)
                  .opacity(0.6)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')
              }
            }
            .padding(10)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .width('100%')
          }
          .onClick(() => {
            // this.pageStack.pushPathByName('DetailPage', project)
            router.pushUrl({url: 'pages/DetailPage', params: project})
          })
        }, (project: Project) => project.title)
      }
      .width('70%')
      .height('100%')
      .backgroundColor('#ffffff')
      .divider({strokeWidth: 1, startMargin: 20, endMargin: 20})
    }
    .width('100%')
    .height('100%')
  }
}

export default ClassPage;