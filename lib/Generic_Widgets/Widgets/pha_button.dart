import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class PHAButton extends StatelessWidget {
  const PHAButton({
    super.key,
    required this.title,
    this.onTap,
    this.topMargin = 0.0,
    this.fillColor = true,
    this.filledColor = const Color(0xff2E2D74),
    this.borderColor,
    this.shadow = false,
  });

  final String title;
  final VoidCallback? onTap;
  final double topMargin;
  final bool fillColor;
  final Color? borderColor;
  final Color? filledColor;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.h/2),
            border: Border.all(
              color: borderColor ?? AppColors.primary,
            ),
            color: fillColor
                ? onTap == null
                    ? filledColor?.withOpacity(0.85) // Disabled state
                    : filledColor
                : Colors.transparent,
            // Conditional shadow
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: AppColors.secondary.withOpacity(0.85),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: PHAText(
              text: title,
              textAlign: TextAlign.center,
              color: fillColor ? AppColors.white : AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
