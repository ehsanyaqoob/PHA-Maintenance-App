import 'package:get/get.dart';
import 'package:pharesidence/Dummy/PHAProjects/listOfProjectCities.dart';
import 'package:pharesidence/Controllers/project_controller.dart';
import 'package:pharesidence/Dummy/items/pha_project_item.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import'package:pharesidence/Utils/exports/exports.dart';

class ProjectCities extends StatefulWidget {
  const ProjectCities({super.key});
  @override
  State<ProjectCities> createState() => _ProjectCitiesState();
}

class _ProjectCitiesState extends State<ProjectCities> {
  var controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.secondary,
      appBar: CustomAppBar(title:'Project Cities',),
      body: Obx((){
        return ListView.builder(
          itemCount: controller.projects.length,
          itemBuilder: (context, index){
            var cityModel = controller.projects.value[index];
            return GestureDetector(
              onTap: () => Get.to(ListOfProjectCities(city: cityModel)),
              child: PHAProjectItem(
                  title: cityModel?.city ?? '',
                  image: cityModel?.cityImage ?? ''),
            );
          },
        );
      }),
    );
  }
}
