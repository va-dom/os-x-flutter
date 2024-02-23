class Todo {
  final String id;
  final String name;
  bool completed = false;

  Todo({required this.id, required this.name, bool? completed});

  Todo copyWith({
    String? id,
    String? name,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      completed: completed ?? this.completed,
    );
  }
}