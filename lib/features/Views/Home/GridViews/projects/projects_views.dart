
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../Api_Providers/api_services_contollers.dart';
import 'projects_view_controller.dart';
import 'property_details.dart';
class ProjectsViews extends StatefulWidget {
  final String cnic; // Assuming you're passing CNIC from a previous screen

  const ProjectsViews({super.key, required this.cnic}); // Added constructor for cnic

  @override
  State<ProjectsViews> createState() => _ProjectsViewsState();
}

class _ProjectsViewsState extends State<ProjectsViews> {
  bool _isLoading = true;
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
   // _fetchProjects();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Property Dashboard',
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProjectList(projects),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectList(List<Project> projectList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PHAText(
          text: 'Your Properties',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.AppPrimary,
        ),
        SizedBox(height: 10.h),
        Container(
          height: 300,
          child: _isLoading
              ? _buildShimmerEffect() // Show shimmer effect while loading
              : ListView.builder(
                  itemCount: projectList.length,
                  itemBuilder: (context, index) {
                    return _buildPropertiesRow(projectList[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildPropertiesRow(Project project) {
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
              PHAText(
                text: project.name,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5.h),
              PHAText(
                text: 'Status: ${project.status}',
                fontSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(Project project) {
    Get.to(() => ProjectDetailsView(project: project));
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 3, // Show 3 shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150.w,
                  height: 20.h,
                  color: Colors.grey.shade300,
                ),
                Container(
                  width: 20.w,
                  height: 20.h,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
