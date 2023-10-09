// @ts-nocheck

import { Task } from '../model/Task';
import { ToDoItemView } from '../view/ToDoItemView';


@Entry
@Component
struct TaskList {
  @State tasks: Array<Task> = [];
  @State keyword: string = "";

  aboutToAppear() {
    this.tasks = Task.examples();
  }

  build(){
    Navigation() {
      Column() {
        Search({ value: this.keyword, placeholder: 'Search'})
          .onChange((value: string) => {
            this.keyword = value
          })
        ForEach(this.search(), (task: Task) =>{
          Row() {
            ToDoItemView({ task: task })
              .gesture(
                SwipeGesture({ direction: SwipeDirection.Horizontal })
                  .onAction(() => {
                  })
              )
              .width('80%')
            Button('Delete', {type: ButtonType.Normal})
              .backgroundColor(Color.Red)
          }
        })
      }
    }
    .margin(15)
    .menus(this.NavigationToolbar)
    .title(this.NavigationTitle)
  }

  @Builder NavigationTitle() {
    Row() {
      Text($r('app.string.page_title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      Blank()
    }
    .width('100%')
  }

  @Builder NavigationToolbar() {
    Row() {
      Image($r("app.media.new_task"))
        .objectFit(ImageFit.Auto)
        .width(24)
        .onClick(() => {
          console.log("clicked")
          let newTask = new Task();
          this.tasks.push(newTask);
        })
    }
  }

  search(): Array<Task> {
    this.tasks = this.tasks.sort((a, b) => {
      return a.createAt < b.createAt;
    })
    if(this.keyword.length == 0){
      return this.tasks;
    }
    let pattern :string  = `.*?${this.keyword.split('').join('.*?')}.*?`;
    let regExp = new RegExp(pattern);
    return this.tasks.filter((task: Task)=>{
      return regExp.test(task.title.toLowerCase());
    });
  }

}


