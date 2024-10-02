// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProjectService {
//   // Function to fetch project data from API
//   Future<List<Project>> fetchProjects() async {
//     final response = await http.get(Uri.parse('https://example.com/api/projects'));

//     if (response.statusCode == 200) {
//       // Parse the JSON response and create a list of projects
//       List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Project.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load projects');
//     }
//   }
// }
