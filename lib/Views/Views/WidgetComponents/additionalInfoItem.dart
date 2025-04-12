import 'package:pharesidence/Utils/exports/exports.dart';

class AdditionalInfoItem extends StatelessWidget {
  String title, description;
  Color textColor;
  AdditionalInfoItem(
      {super.key, required this.title, required this.description, this.textColor = const Color(0xFF484848)});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColors.lightGray_1, width: 1.5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(width: 8.w),
            Expanded(
              child: PHAText(
                  text: title,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            ),
            Expanded(
              flex: 1,
              child: PHAText(
                  text: description,
                  textAlign: TextAlign.right,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp),
            )
          ],
        ),
      ),
    );
  }
}
