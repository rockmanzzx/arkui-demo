import ClassPage from './ClassPage'

@Entry
@Component
struct TabBarPage {
  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        ClassPage()
      }
      .tabBar('首页')

      TabContent() {
        Text('推荐的内容').fontSize(30)
      }
      .tabBar('推荐')

      TabContent() {
        Text('发现的内容').fontSize(30)
      }
      .tabBar('发现')

      TabContent() {
        Text('我的内容').fontSize(30)
      }
      .tabBar("我的")
    }
  }
}