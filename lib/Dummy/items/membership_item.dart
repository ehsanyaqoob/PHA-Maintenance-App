import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class MembershipItem extends StatelessWidget {
  String title, value;
  Color? valueColor;
  MembershipItem(
      {super.key,
        required this.title,
        required this.value,
        this.valueColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PHAText(
          text: title.toUpperCase(),
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.AppThird,
        ),
        SizedBox(width: 12),
        PHAText(
          text: value.toUpperCase(),
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.AppPrimary,
        ),
      ],
    );
  }
}