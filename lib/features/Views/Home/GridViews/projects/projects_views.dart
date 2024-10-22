import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';
import '../../../../../Generic_Widgets/Widgets/custom_loarder.dart';
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
          return Center(child: PHALoader());
        }
        if (_controller.projects.isEmpty) {
          return Center(child: Text('No projects found.'));
        }
        return _buildProjectList(_controller.projects);
      }),
    );
  }

  Widget _buildProjectList(List<Data> projectList) {
    return ListView.builder(
      itemCount: projectList.length,
      itemBuilder: (context, index) {
        return _buildPropertiesRow(projectList[index]);
      },
    );
  }


  Widget _buildPropertiesRow(Data project) {
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
                project.fullName ?? 'Unnamed Project',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Project Name: ${project.projectName ?? 'N/A'}',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Status: ${project.status ?? 'Unknown'}',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(Data project) {
    Get.to(() => ProjectDetailsView(project: project));
  }
}

class ProjectDetailsView extends StatelessWidget {
  final Data project;

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
              'Project Name: ${project.projectName ?? 'N/A'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Full Name: ${project.fullName ?? 'N/A'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${project.status ?? 'Unknown'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Present Address: ${project.presentAddress ?? 'N/A'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
