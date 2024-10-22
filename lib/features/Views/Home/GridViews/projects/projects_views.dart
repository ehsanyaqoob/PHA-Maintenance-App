import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';
import '../../../../../Shared/Controllers.dart/project_controller.dart';
import '../../../../../models/projects_models.dart';

class ProjectsViews extends StatefulWidget {
  final String cnic;

  const ProjectsViews({super.key, required this.cnic});

  @override
  State<ProjectsViews> createState() => _ProjectsViewsState();
}

class _ProjectsViewsState extends State<ProjectsViews> {
  final ProjectsViewController _controller = Get.put(ProjectsViewController());

  @override
  void initState() {
    super.initState();
    _controller.fetchProjects(widget.cnic); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Property Dashboard',
        centerTitle: false,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator()); 
        }

        return _buildProjectList(_controller.projects); 
      }),
    );
  }

  Widget _buildProjectList(List<MembershipData> projectList) {
    return ListView.builder(
      itemCount: projectList.length,
      itemBuilder: (context, index) {
        return _buildPropertiesRow(projectList[index]);
      },
    );
  }

  Widget _buildPropertiesRow(MembershipData project) {
    return GestureDetector(
      onTap: () {
        _showProjectDetails(project);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.fullName ?? '',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Status: ${project.status}'),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(MembershipData project) {
    Get.to(() => ProjectDetailsView(project: project)); // Navigate to ProjectDetailsView
  }
}

// Widget to display project details
class ProjectDetailsView extends StatelessWidget {
  final MembershipData project; // Change this to Data

  const ProjectDetailsView({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.fullName ?? 'Project Details'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Name: ${project.fullName ?? 'N/A'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${project.status ?? 'Unknown'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Add more details as needed
            // Text(
            //   'Details: ${project.details ?? 'No details available.'}', // Assuming 'details' is a field in Data
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}
