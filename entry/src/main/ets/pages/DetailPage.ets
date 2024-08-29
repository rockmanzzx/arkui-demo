import router from '@ohos.router';
import { Project } from '../model/Model'

@Entry
@Component
struct JavaTutorialPage {
  @State learningCount: number = 14659401;

  project: Project = router.getParams() as Project; // 获取传递过来的参数对象

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.back')).width(24).height(24)
          .onClick(() => {
            router.back()
          })
        Text(this.project.title).fontSize(20).fontWeight(FontWeight.Medium).margin({ left: 16 })
        Blank()
        Image($r('app.media.more')).width(24).height(24)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#FFFFFF')

      // 主要内容
      Scroll() {
        Column() {
          // Java logo
          Image($r(this.project.icon))
            .width('100%')
            .height(200)
            .objectFit(ImageFit.Cover)
            .borderRadius(16)
            .margin({ top: 16 })

          // 标题
          Text(this.project.title)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 16 })

          // 学习次数
          Text(`学习: ${this.learningCount}次`)
            .fontSize(14)
            .fontColor('#666666')
            .margin({ top: 8 })

          // 操作按钮
          Row() {
            Button('下载离线版')
              .fontColor('#FF6B00')
              .backgroundColor('#FFF0E5')
              .borderRadius(20)
            Button('收藏')
              .fontColor('#000000')
              .backgroundColor('#F1F3F5')
              .borderRadius(20)
              .margin({ left: 16 })
          }
          .margin({ top: 16 })

          // 手册简介
          Text('手册简介:')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .margin({ top: 24, bottom: 8 })
          Text('一种可以撰写跨平台应用软件的面向对象的程序设计语言。')
            .fontSize(16)
            .fontColor('#333333')

          // 手册说明
          Text('手册说明:')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .margin({ top: 24, bottom: 8 })
          Text('Java 是一门面向对象的编程语言，所以Java并不是最容易入手的开发语言，根据这个特性，本教程精心编排,优先讲解了面向对象编程的基本概念，再讲解Java基础知识，最后再介绍Java的继承，封装，多态等面向对象的特性，以求用易懂的方式，最精简的语句，最充实的内容，向读者介绍Java。\n\n当然，Java同时也是一门非常强大的语言，它既有')
            .fontSize(16)
            .fontColor('#333333')
        }
        .padding(16)
      }
      .layoutWeight(1)

      // 底部按钮
      Button('继续学习', { type: ButtonType.Capsule, stateEffect: true })
        .width('90%')
        .height(50)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#FF6B00')
        .margin({ bottom: 16 })
        .onClick(() => {
          router.pushUrl({url: 'pages/LearnPage'})
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}