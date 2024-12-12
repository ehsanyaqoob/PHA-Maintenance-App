import 'package:get/get.dart';
import 'package:pharesidence/Dummy/PHAProjects/projectDetails.dart';
import 'package:pharesidence/Controllers/project_controller.dart';
import 'package:pharesidence/Dummy/items/pha_project_item.dart';
import 'package:pharesidence/Entities/city_model.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class ListOfProjectCities extends StatefulWidget {
  CityModel city;
  ListOfProjectCities({super.key, required this.city});
  @override
  State<ListOfProjectCities> createState() => _ListOfProjectCitiesState();
}

class _ListOfProjectCitiesState extends State<ListOfProjectCities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.secondary,
      appBar: CustomAppBar(title:  'Project Detail', ),
      body: ListView.builder(
        itemCount: widget.city.projects?.length ?? 0,
        itemBuilder: (context, index) {
          var project = widget.city.projects?[index];
          return GestureDetector(
            onTap: () => Get.to(ProjectDetails(project: project!)),
            child: PHAProjectItem(
                title: project?.projectName ?? '',
                image: project?.projectImage ?? ''),
          );
        },
      ),
    );
  }
}