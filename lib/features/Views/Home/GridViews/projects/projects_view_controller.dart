// import 'package:get/get.dart';

// class ProjectsController extends GetxController {
//   var isLoading = true.obs;
//   var projectsList = <Project>[].obs;

//   final ProjectService _projectService = ProjectService();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProjects();
//   }

//   void fetchProjects() async {
//     try {
//       isLoading(true);
//       var projects = await _projectService.fetchProjects();
//       projectsList.assignAll(projects);
//     } finally {
//       isLoading(false);
//     }
//   }
// }
