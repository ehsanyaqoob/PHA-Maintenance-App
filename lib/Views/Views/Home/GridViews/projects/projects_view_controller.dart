class Project {
  final String name; // Project name
  final String fullName; // Full name of the person
  final String status; // Status of the project

  Project({
    required this.name,
    required this.fullName,
    required this.status,
  });

  // Create a factory constructor to initialize the object from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['projectName'],
      fullName: json['full_name'],
      status: json['status'],
    );
  }
}
