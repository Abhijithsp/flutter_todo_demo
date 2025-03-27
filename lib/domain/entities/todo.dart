class Todo {
  final String id;
  final String title;
  final String description;
  final bool isActive;

  Todo({required this.id, required this.title,required this.description, this.isActive = false});
}