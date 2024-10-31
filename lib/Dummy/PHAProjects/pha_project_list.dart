import 'package:get/get.dart';
import 'package:pharesidence/Dummy/PHAProjects/pha_project_details.dart';
import 'package:pharesidence/Dummy/dummy_controller.dart';
import 'package:pharesidence/Dummy/items/pha_project_item.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
class ListOfCities extends StatefulWidget {
  CityModel city;
  ListOfCities({super.key, required this.city});
  @override
  State<ListOfCities> createState() => _ListOfCitiesState();
}

class _ListOfCitiesState extends State<ListOfCities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: PHAText(text: 'Project Detail', fontSize: 18.sp)),
      body: ListView.builder(
        itemCount: widget.city.projects?.length ?? 0,
        itemBuilder: (context, index) {
          var project = widget.city.projects?[index];
          return GestureDetector(
            onTap: () => Get.to(ProjectsDetails(project: project!)),
            child: PHAProjectItem(
                title: project?.projectName ?? '',
                image: project?.projectImage ?? ''),
          );
        },
      ),
    );
  }
}