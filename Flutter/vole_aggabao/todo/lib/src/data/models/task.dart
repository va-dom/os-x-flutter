class Task {
  final String id;
  final String description;
  final DateTime dueDate;
  final int categoryId;
  bool completed;

  // Default Parameter Values
  // Providing default values for optional parameters 
  // simplifies object creation
  Task({
    required this.id,
    required this.description,
    required this.dueDate,
    required this.categoryId,
    this.completed = false,
  });

  // Named Constructor
  // Using a named constructor (Task.fromMap) to convert data from a Map to a Task object is a good practice
  // for clarity and maintainability
  Task.fromMap(Map<String, dynamic> data) :
    id = data['id'] ?? '',
    description = data['description'] ?? '',
    dueDate = data['dueDate'] ?? DateTime.now(),
    categoryId = data['categoryId'] ?? '',
    completed = data['completed'] ?? false;
  // Error Handling
  // Handling potential null values in the data map using the null-aware operator (??)
  // provides a default value when needed

  // Consistent Naming
  // The naming of the methods (fromMap, toMap) and parameters is consistent and descriptive
  // improves readability
  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'categoryId': categoryId,
    'dueDate': dueDate,
    'completed': completed,
  };
}