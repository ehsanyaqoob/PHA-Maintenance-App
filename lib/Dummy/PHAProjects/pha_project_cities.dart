import 'package:get/get.dart';
import 'package:pharesidence/Dummy/PHAProjects/pha_project_list.dart';
import 'package:pharesidence/Dummy/dummy_controller.dart';
import 'package:pharesidence/Dummy/items/pha_project_item.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import'package:pharesidence/exports/exports.dart';
class ProjectCities extends StatefulWidget {
  const ProjectCities({super.key});
  @override
  State<ProjectCities> createState() => _ProjectCitiesState();
}

class _ProjectCitiesState extends State<ProjectCities> {
  var controller = Get.put(DummyProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: PHAText(text: 'Projects Cities', fontSize: 18.sp)),
      body: Obx((){
        return ListView.builder(
          itemCount: controller.projects.length,
          itemBuilder: (context, index){
            var cityModel = controller.projects.value[index];
            return GestureDetector(
              onTap: () => Get.to(ListOfCities(city: cityModel)),
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
