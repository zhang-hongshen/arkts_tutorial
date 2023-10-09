
import { Task } from '../model/Task';

@Component
export struct ToDoItemView {
  task: Task;

  build(){
    Row(){
      Checkbox()
        .select(this.task.completed)
        .onChange((value: boolean) => {
          this.task.completed = value
        })
      TextInput({ text: this.task.title, placeholder: 'title'})
        .style(TextInputStyle.Inline)
        .onChange((value: string) => {
          this.task.title = value
        })
    }
    .onClick(() => {
      this.task.completed = !this.task.completed
    })
  }
}

@Preview
@Component    //定义组件片段TitlePreview
struct ToDoItemView_Preview {
  build() {
    ToDoItemView({ task: Task.example() })
  }
}

