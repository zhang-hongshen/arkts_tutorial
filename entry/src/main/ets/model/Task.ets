

export class Task {
  title: string;
  completed: boolean;
  createAt: Date

  constructor(title: string = "", completed: boolean  = false) {
    this.title = title;
    this.completed = completed;
    this.createAt = new Date();
  }

  static example() : Task {
    return new Task("看剧1231231", true);
  }

  static examples() : Array<Task> {
    return [
      new Task("打游戏"),
      new Task("看剧", true),
      new Task("踢足球⚽️"),
      new Task("🎑赏月️", true),
    ]
  }

}

