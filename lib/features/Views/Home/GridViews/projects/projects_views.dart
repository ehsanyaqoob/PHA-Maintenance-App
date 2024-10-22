import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
    _controller.fetchProjects(widget.cnic); // Fetch projects using CNIC
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Property Dashboard'),
        centerTitle: false,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator()); // Show loader while fetching
        }

        if (_controller.projects.isEmpty) {
          return Center(child: Text("No projects available")); // Show if no projects are found
        }

        // Build the project list when data is available
        return _buildProjectList(_controller.projects);
      }),
    );
  }

  Widget _buildProjectList(List<MembershipData> projectList) {
    return ListView.builder(
      itemCount: projectList.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return _buildProjectCard(projectList[index]);
      },
    );
  }

  Widget _buildProjectCard(MembershipData project) {
    return GestureDetector(
      onTap: () {
        _showProjectDetails(project); // Navigate to project details when tapped
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.fullName ?? 'N/A', // Display project full name
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Status: ${project.status ?? 'Unknown'}', // Display project status
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8),
              // Text(
              //   'Membership ID: ${project.membershipId ?? 'N/A'}', // Display membership ID
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.grey[700],
              //   ),
              // ),
              SizedBox(height: 8),
              Text(
                'CNIC: ${project.cnic ?? 'N/A'}', // Display CNIC
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(MembershipData project) {
    // Navigate to detailed view of the project
    Get.to(() => ProjectDetailsView(project: project));
  }
}


class ProjectDetailsView extends StatelessWidget {
  final MembershipData project;

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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Status: ${project.status ?? 'Unknown'}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            // Text(
            //   'Membership ID: ${project.membershipId ?? 'N/A'}',
            //   style: TextStyle(
            //     fontSize: 18,
            //   ),
            // ),
            SizedBox(height: 20),
            Text(
              'CNIC: ${project.cnic ?? 'N/A'}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            // You can add more details here depending on what the `MembershipData` model contains
            // For example:
            // Text('Some other field: ${project.someField ?? 'N/A'}')
          ],
        ),
      ),
    );
  }
}
