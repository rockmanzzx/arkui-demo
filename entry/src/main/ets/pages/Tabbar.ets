import Test from './Test'
import MenuList from './MenuList'

@Entry
@Component
struct Tabbar {
  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Test()
      }
      .tabBar('首页')

      TabContent() {
        // Text('推荐的内容').fontSize(30)
        MenuList()
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