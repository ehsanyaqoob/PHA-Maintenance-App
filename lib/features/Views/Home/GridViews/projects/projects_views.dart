import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_generic_button.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/models/additionalInfo_model.dart';
import '../../../../../Generic_Widgets/Widgets/custom_loarder.dart';
import '../../../../../Shared/Controllers.dart/project_controller.dart';
import '../../../../../models/projects_models.dart';
import '../../Additional_inof_view/additional_info.dart';

class ProjectsViews extends StatefulWidget {
  final String cnic;

  const ProjectsViews({super.key, required this.cnic});

  @override
  State<ProjectsViews> createState() => _ProjectsViewsState();
}

class _ProjectsViewsState extends State<ProjectsViews> {
  final ProjectsViewController _controller = Get.put(ProjectsViewController());
  bool _isLoading = true; // Add a flag to track loading state

  @override
  void initState() {
    super.initState();
    _showLoaderForDuration();
    _controller.fetchProjects(widget.cnic); // Fetch projects using CNIC
  }

  Future<void> _refreshProjects() async {
    // This method will refresh the project list with a loader
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulate 2-second loader
    await _controller.fetchProjects(widget.cnic);

    setState(() {
      _isLoading = false;
    });
  }

  void _showLoaderForDuration() async {
    // Show the loader for 2 seconds when the page is loaded
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Property Dashboard',
        centerTitle: false,
      ),
      body: _isLoading
          ? Center(child: PHALoader()) // Show PHALoader when loading
          : Obx(() {
              if (_controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                ); // Show loader while fetching
              }

              if (_controller.projects.isEmpty) {
                return Center(child: Text("No projects available"));
              }

              // Build the project list when data is available
              return RefreshIndicator(
                onRefresh: _refreshProjects, // Add the refresh functionality
                child: _buildProjectList(_controller.projects),
              );
            }),
    );
  }

  Widget _buildProjectList(List<MembershipData> projectList) {
    return ListView.builder(
      itemCount: projectList.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: _buildProjectCard(projectList[index]),
        );
      },
    );
  }

  Widget _buildProjectCard(MembershipData project) {
    return GestureDetector(
      onTap: () {
        _showProjectDetails(project);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: AppColors.AppPrimary.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff2E2D74),
                const Color(0xff2E2D74),
                const Color(0xff2E2D74),
                const Color(0xff2E81A4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColors.AppSecondary,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: PHAText(
                        text:
                            'Project Name: ${project.projectName ?? 'Unknown'}',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
               
                // const SizedBox(height: 12),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.category,
                //       color: Colors.white70,
                //     ),
                //     SizedBox(width: 8),
                //     PHAText(
                //       text: 'Category: ${project.category ?? 'N/A'}',
                //       fontSize: 16,
                //       color: Colors.white70,
                //     ),
                //   ],
                // ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8),
                    PHAText(
                      text: 'Membership No: ${project.registrationNo ?? 'N/A'}',
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ],
                ),
                 const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.streetview,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8),
                    PHAText(
                      text: 'Lane No: ${project.id ?? 'Unknown'}',
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      // Use Flexible to avoid overflow
                      child: PHAText(
                        text: ' House No: ${project.houseNo ?? 'N/A'}',
                        fontSize: 16,
                        color: Colors.white70,
                        maxLines: 2, // Limit the number of lines
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWithIcon(
                      text: 'See Details',
                      icon: Icons.details,
                      backgroundColor: AppColors.AppSecondary,
                      textColor: AppColors.AppPrimary,
                      iconColor: AppColors.AppPrimary,
                      onTap: () {
                        Get.to(ProjectDetailsView(
                          project: project,
                        ));
                      },
                    ),
                    CustomButtonWithIcon(
                        text: 'Pay Bill',
                        icon: Icons.details,
                        backgroundColor: AppColors.AppSecondary,
                        textColor: AppColors.AppPrimary,
                        iconColor: AppColors.AppPrimary,
                        onTap: () async {
                          final controller = Get.find<ProjectsViewController>();
                          String? cnic = project.cnic;

                          if (cnic != null && cnic.isNotEmpty) {
                            await controller.fetchAdditionalInfo(cnic);
                            if (controller.additionalInfoList.isNotEmpty) {
                              Get.to(() => AdditionalProjectDetailsView());
                            } else {
                              Get.snackbar(
                                  'Error', 'No additional info found.');
                            }
                          } else {
                            Get.snackbar('Error', 'CNIC is not available');
                          }
                          ;
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(MembershipData project) {
    Get.to(() => ProjectDetailsView(project: project));
  }
}

class ProjectDetailsView extends StatelessWidget {
  final MembershipData project;

  const ProjectDetailsView({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: project.projectName ?? 'Project Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(), // Add profile-like section
              SizedBox(height: 20),
              _buildDetailCard('Project Name', project.projectName, Icons.work),
              _buildDetailCard('Project ID', project.projectId?.toString(),
                  Icons.fingerprint),
              _buildDetailCard('Registration No.', project.registrationNo,
                  Icons.confirmation_number),
              _buildDetailCard('CNIC', project.cnic, Icons.credit_card),
              _buildDetailCard('Lane No.', project.laneNo, Icons.location_on),
              _buildDetailCard('House No.', project.houseNo, Icons.home),
              _buildDetailCard('Category', project.category, Icons.category),
              _buildDetailCard(
                  'Present Address', project.presentAddress, Icons.place),
              _buildDetailCard('Cell', project.cell, Icons.phone),
              _buildDetailCard('Status', project.status, Icons.info_outline),
              _buildDetailCard(
                'Created At',
                project.createdAt != null
                    ? project.createdAt!.toIso8601String()
                    : 'N/A',
                Icons.date_range,
              ),
              _buildDetailCard(
                'Updated At',
                project.updatedAt != null
                    ? project.updatedAt!.toIso8601String()
                    : 'N/A',
                Icons.update,
              ),
              _buildDetailCard(
                'Deleted At',
                project.deletedAt != null
                    ? project.deletedAt!.toIso8601String()
                    : 'N/A',
                Icons.delete_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String? value, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.AppPrimary),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.AppPrimary,
          ),
        ),
        subtitle: Text(
          value ?? 'N/A',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.AppPrimary,
              child: Icon(Icons.person, size: 30, color: Colors.white),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.projectName ?? 'N/A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.AppPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Project ID: ${project.projectId ?? 'N/A'}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}