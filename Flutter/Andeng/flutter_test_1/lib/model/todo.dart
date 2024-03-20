class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  String category;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    required this.category,
  });

  // Add a copyWith method
  ToDo copyWith({
    String? id,
    String? todoText,
    bool? isDone,
    String? category,
  }) {
    return ToDo(
      id: id ?? this.id,
      todoText: todoText ?? this.todoText,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
    );
  }

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '01',
        todoText: 'Test',
        isDone: true,
        category: 'Category A',
      ),
      ToDo(
        id: '02',
        todoText: 'Task',
        isDone: false,
        category: 'Category B',
      ),
    ];
  }
}
