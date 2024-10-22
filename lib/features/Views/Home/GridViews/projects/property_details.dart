
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

import '../../../../../models/projects_models.dart';
import 'projects_view_controller.dart';


class ProjectDetailsView extends StatelessWidget {
  final Data project;

  const ProjectDetailsView({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Property Details',
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            PHAText(
              text: 'Project: ${project.fullName}', // Use the correct field
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.AppPrimary,
            ),
            SizedBox(height: 20.h),
            PHAText(
              text: 'Properties:',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
           // _buildPropertyList(project.propertyDetails ?? []), // Use the correct field
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyList(List<String> properties) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: properties.map((property) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PHAText(
              text: property,
              fontSize: 16.sp,
            ),
          );
        }).toList(),
      ),
    );
  }
}
