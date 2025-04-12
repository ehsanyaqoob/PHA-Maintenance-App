import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Views/Views/Home/Additional_inof_view/additional_info.dart';
import 'package:pharesidence/Views/historyView.dart';

class PropertyItem extends StatelessWidget {
  Property property;
  PropertyItem({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            SizedBox(height: 8),
            PropertyInternalItem(
              title: 'Name',
              value: property.fullName ?? '',
            ),

            Row(
              children: [
                PropertyInternalItem(
                  title: 'Membership#',
                  value: property.registrationNo ?? '',
                ),
                Spacer(),
                PropertyInternalItem(
                  title: 'Project Name',
                  value: property.projectName ?? '',
                ),
                Spacer(),
              ],
            ),
            // PropertyInternalItem(
            //   title: 'House#',
            //   value: property.houseNo ?? '',
            // ),
            PropertyInternalItem(
              title: 'Address',
              value: 'House No. ${property.houseNo}, Lane#${property.laneNo}, ${property.projectName}',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButtonWithIcon(
                      text: 'Previous Bill / سابقہ بل',
                      icon: Icons.details,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.blackGray,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      onTap: () => Get.to(HistoryView(membershipID: '${property.registrationNo ?? ' '}')),
                      // onTap: () =>
                      //     Get.to(PropertyDetailView(property: property)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomButtonWithIcon(
                        text: 'Pay Bill / بل کی ادائیگی',
                        icon: Icons.details,
                        backgroundColor: AppColors.white,
                        textColor: AppColors.blackGray,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        onTap: () => Get.to(AdditionalDetailView(property: property))),
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