import router from '@ohos.router';

import resourceManager from '@ohos.resourceManager';
import { common } from '@kit.AbilityKit';
import util from '@ohos.util';
import buffer from '@ohos.buffer';

import {Model, Category, Project} from '../model/Model'

interface ContentItem {
  title: string;
  description: string;
  icon: Resource;
}

@Entry
@Component
struct Test {
  @State currentCategory: string = '热门教程';
  @State categories: string[] = ['热门教程', 'HTML/CSS', 'JavaScript', '前端框架', '后端语言', '开发框架', '数据库', '移动开发', '服务器相关', '开发工具', '大数据', '软件工程', '人工智能'];
  @State contentList: ContentItem[] = [
    { title: 'HTML 教程', description: 'HTML 指超文本标记语言。HTML 是通向 WEB...', icon: $r('app.media.cover_html') },
    { title: 'XHTML 教程', description: 'XHTML是一种比HTML更为严格的可扩展超文...', icon: $r('app.media.cover_html') },
    { title: 'HTML5 教程', description: 'HTML 5 是下一代的 HTML。HTML5 仍处于...', icon: $r('app.media.cover_html') },
    { title: 'HTML 参考手册', description: '您可以使用 HTML 来建立自己的 WEB 站点。在...', icon: $r('app.media.cover_html') },
    { title: 'CSS 教程', description: 'CSS 指层叠样式表 (Cascading Style...', icon: $r('app.media.cover_html') },
    { title: 'CSS3 教程', description: 'CSS3 是最新的 CSS 标准。我们的 CSS3 教程...', icon: $r('app.media.cover_html') },
    { title: 'CSS 参考手册', description: 'css的基础参考手册，通过一系列主流浏览器的测...', icon: $r('app.media.cover_html') },
  ];
  @State dataSource: Category[] = [];

  aboutToAppear(): void {
    let mContext=getContext() as  common.UIAbilityContext;
    this.getjson(mContext);
  }

  async getjson(context :common.UIAbilityContext){
    let getjson=await context.resourceManager.getRawFileContent('data.json');

    let textDecoderOptions: util.TextDecoderOptions = { ignoreBOM : true }
    let textDecoder = util.TextDecoder.create("utf-8",textDecoderOptions);
    let result =textDecoder.decodeWithStream(getjson,{ stream:false });
    console.log(result)

    let model:Model=JSON.parse(result);
    this.dataSource=model.categories;

  }

  build() {
    Row() {
      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.dataSource, (category: Category, index: number) => {
          ListItem() {
            Text(category.title)
              .fontSize(16)
              .fontWeight(this.currentCategory === category ? FontWeight.Bold : FontWeight.Normal)
              .padding(10)
          }
          .onClick(() => {
            // this.currentCategory = category;
          })
        }, (item: string) => item)
      }
      .width('30%')
      .height('100%')
      .backgroundColor('#f1f1f1')

      List({ space: 10, initialIndex: 0}) {
        ForEach(this.contentList, (item: ContentItem, index: number) => {
          ListItem() {
            Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
              Image(item.icon).width(80).aspectRatio(1) .margin({ right: 10 })
              Column() {
                Text(item.title)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                Text(item.description)
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
            router.pushUrl({
              url: 'pages/DetailPage',
              params: {
                title: item.title,
                description: item.description
              }
            });
          })
        }, (item: ContentItem) => item.title)
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

// @Entry
// @Component
// struct DetailPage {
//   private title: string = router.getParams()['title'];
//   private description: string = router.getParams()['description'];
//
//   build() {
//     Column() {
//       Text(this.title)
//         .fontSize(24)
//         .fontWeight(FontWeight.Bold)
//         .margin({ top: 20, bottom: 10 })
//       Text(this.description)
//         .fontSize(16)
//         .margin(10)
//     }
//     .width('100%')
//     .height('100%')
//     .backgroundColor(Color.White)
//   }
// }

export default Test;