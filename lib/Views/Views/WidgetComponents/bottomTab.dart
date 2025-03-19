import 'package:pharesidence/Utils/exports/exports.dart';

class BottomTab extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const BottomTab({
    super.key,
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 45.h,
            width: 45.h,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: SvgPicture.asset(image),
          ),
          const SizedBox(height: 8),
          PHAText(
            text: label,
            fontSize: 12.sp,
            color: AppColors.blackGray,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
