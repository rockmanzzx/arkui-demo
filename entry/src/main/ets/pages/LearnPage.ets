import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct LearnPage {

  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Row() {
      Web({src:'https://www.w3cschool.cn/python3/', controller: this.controller})
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}