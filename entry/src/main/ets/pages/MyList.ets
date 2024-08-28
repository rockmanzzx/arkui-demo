@Entry
@Component
struct MyList {

  @State categories: string[] = ['热门教程', 'HTML/CSS', 'JavaScript', '前端框架', '后端语言', '开发框架', '数据库', '移动开发', '服务器相关', '开发工具', '大数据', '软件工程', '人工智能',
    '热门教程', 'HTML/CSS', 'JavaScript', '前端框架', '后端语言', '开发框架', '数据库', '移动开发', '服务器相关', '开发工具', '大数据', '软件工程', '人工智能'];


  build() {
    List() {
      ForEach(this.categories, (item: string) => {
        ListItem() {
          Text(item)
        }
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('red')
  }

}

export default MyList;