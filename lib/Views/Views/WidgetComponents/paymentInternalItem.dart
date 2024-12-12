import 'package:pharesidence/Utils/exports/exports.dart';

class PropertyInternalItem extends StatelessWidget {
  IconData icon;
  String title;
  FontWeight fontWeight;
  PropertyInternalItem(
      {super.key,
        required this.icon,
        required this.title,
        this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.white),
          SizedBox(width: 8),
          Expanded(
            child: PHAText(
              text: title,
              fontSize: 14.sp,
              fontWeight: fontWeight,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}