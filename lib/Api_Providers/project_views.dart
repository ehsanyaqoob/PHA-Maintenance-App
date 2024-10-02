class Project {
  final String name;
  final String status;
  final String description;

  Project({
    required this.name,
    required this.status,
    required this.description,
  });

  // Factory method to parse JSON data
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      status: json['status'],
      description: json['description'],
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'description': description,
    };
  }
}
