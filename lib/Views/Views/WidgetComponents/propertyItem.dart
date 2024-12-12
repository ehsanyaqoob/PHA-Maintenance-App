import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Views/Views/Home/Additional_inof_view/additional_info.dart';

class PropertyItem extends StatelessWidget {
  Property property;
  PropertyItem({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff2E2D74),
              const Color(0xff2E2D74),
              const Color(0xff2E81A4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            PropertyInternalItem(
                icon: Icons.person_outline,
                title: 'Project Name: ${property.projectName}',
                fontWeight: FontWeight.w800),
            PropertyInternalItem(
                icon: Icons.category, title: 'Category: ${property.category}'),
            PropertyInternalItem(
                icon: Icons.article_outlined,
                title: 'Membership No: ${property.registrationNo}'),
            PropertyInternalItem(
                icon: Icons.home, title: 'House No: ${property.houseNo}'),
            PropertyInternalItem(
                icon: Icons.streetview, title: 'Lane No: ${property.laneNo}'),
            // SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButtonWithIcon(
                      text: 'See Details',
                      icon: Icons.details,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.secondary,
                      fontSize: 14.sp,
                      onTap: () =>
                          Get.to(PropertyDetailView(property: property)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomButtonWithIcon(
                        text: 'Pay Bill',
                        icon: Icons.details,
                        backgroundColor: AppColors.white,
                        textColor: AppColors.secondary,
                        fontSize: 14.sp,
                        onTap: () => Get.to(AdditionalDetailView(membershipID: property.registrationNo ?? ''))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
