import 'package:pharesidence/Dummy/dummy_controller.dart';
import 'package:pharesidence/Dummy/items/membership_item.dart';
import 'package:pharesidence/exports/exports.dart';

import '../../Generic_Widgets/Widgets/pha_text.dart';
class ProjectsDetails extends StatefulWidget {
  ProjectModel project;
  ProjectsDetails({super.key, required this.project});

  @override
  State<ProjectsDetails> createState() => _ProjectsDetailsState();
}

class _ProjectsDetailsState extends State<ProjectsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: PHAText(text: widget.project.projectName!.toUpperCase(), fontSize: 18.sp)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.project.projectImage ?? ''),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              SizedBox(height: 16),
              MembershipItem(title: 'Project', value: widget.project.projectName ?? ''),
              SizedBox(height: 16),
              MembershipItem(title: 'Project Type', value: widget.project.projectType ?? ''),
              SizedBox(height: 16),
              MembershipItem(title: 'Categories', value: widget.project.projectCategories ?? ''),
              SizedBox(height: 16),
              MembershipItem(title: 'Total Apartments / Units', value: widget.project.projectTotalApartments ?? ''),
              SizedBox(height: 16),
              MembershipItem(title: 'Completion Period', value: widget.project.projectCompletedPeriod ?? ''),
              SizedBox(height: 16),
              MembershipItem(title: 'Total Price', value: widget.project.projectTotalPrice ?? ''),
              SizedBox(height: 16),
              MembershipItem(title: 'Project Details', value: widget.project.projectDetails ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
