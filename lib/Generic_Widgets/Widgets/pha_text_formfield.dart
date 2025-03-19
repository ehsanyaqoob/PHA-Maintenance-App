import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class PHATextFormField extends StatelessWidget {
  TextEditingController? controller;
  String hint;
  String title;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatters;
  Widget? prefix;
  ValueChanged<String>? onChanged;
  bool? isObscure;
  VoidCallback? onTap;
  String? errorText;
  bool? readOnly;
  bool? autoFocus;
  Widget? suffix;
  double? topPadding;
  TextAlign textAlign;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  ValueChanged? onSubmitted;
  VoidCallback? onSearch;

  PHATextFormField(
      {super.key,
        this.title = '',
        required this.hint,
        this.controller,
        this.inputType = TextInputType.text,
        this.inputFormatters,
        this.prefix,
        this.onChanged,
        this.isObscure,
        this.onTap,
        this.errorText,
        this.readOnly,
        this.autoFocus,
        this.suffix,
        this.topPadding,
        this.textAlign = TextAlign.left,
        this.textCapitalization = TextCapitalization.none,
        this.textInputAction = TextInputAction.next,
        this.onSubmitted, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != '',
            child: PHAText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          title != '' ? SizedBox(height: 4) : SizedBox(height: 0),
          Stack(
            children: [
              TextFormField(
                textInputAction: textInputAction,
                textCapitalization: textCapitalization,
                controller: controller,
                keyboardType: inputType ?? TextInputType.text,
                inputFormatters: inputFormatters ?? [],
                cursorColor: AppColors.primary,
                autofocus: autoFocus ?? false,
                textAlign: textAlign,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onFieldSubmitted: onSubmitted,
                decoration: InputDecoration(
                  hintText: hint,
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  fillColor: AppColors.lightGray_2,
                  filled: true,
                  errorText: errorText,
                  errorStyle: TextStyle(
                    color: AppColors.red,
                    fontSize: 10.sp,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.blackGray,
                    fontSize: 12.sp,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 1.5, color: AppColors.lightGray_1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.5, color: AppColors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.5, color: AppColors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 1.5, color: AppColors.lightGray_1),
                  ),
                  isDense: true,
                ),
                readOnly: readOnly ?? false,
                style: TextStyle(
                  color: AppColors.blackGray,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: onChanged,
                onTap: onTap,
                obscureText: isObscure ?? false,
              ),
              Visibility(
                visible: onSearch == null ? false : true,
                child: Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: onSearch,
                    child: Container(
                      width: 120,
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.all(Radius.circular(40 / 2))),
                      child: Center(
                          child: PHAText(
                              text: 'Search',
                              color: Colors.white,
                              font: AppFonts.poppins,
                              fontSize: 10.sp)),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TextFieldIcon extends StatelessWidget {
  String icon;
  Color color;
  TextFieldIcon({super.key, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      padding: EdgeInsets.all(12),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}


// class PHATextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hint;
//   final String title;
//   final TextInputType? inputType;
//   final List<TextInputFormatter>? inputFormatters;
//   final Widget? prefix;
//   final ValueChanged<String>? onChanged;
//   final bool? isObscure;
//   final VoidCallback? onTap;
//   final String? errorText;
//   final bool? readOnly;
//   final bool? autoFocus;
//   final Widget? suffix;
//   final double? topPadding;
//   final TextAlign textAlign;
//   final TextCapitalization textCapitalization;
//   final TextInputAction textInputAction;
//   final ValueChanged<String>? onSubmitted;
//   final FocusNode? focusNode; // Added FocusNode parameterhamo
//
//   PHATextFormField({
//     Key? key,
//     this.title = '',
//     required this.hint,
//     this.controller,
//     this.inputType = TextInputType.text,
//     this.inputFormatters,
//     this.prefix,
//     this.onChanged,
//     this.isObscure,
//     this.onTap,
//     this.errorText,
//     this.readOnly,
//     this.autoFocus,
//     this.suffix,
//     this.topPadding,
//     this.textAlign = TextAlign.left,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.textInputAction = TextInputAction.next,
//     this.onSubmitted,
//     this.focusNode,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: topPadding ?? 0.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (title.isNotEmpty)
//             PHAText(
//               text: title,
//               fontSize: 18,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ),
//           if (title.isNotEmpty) SizedBox(height: 4),
//           TextFormField(
//             textInputAction: textInputAction,
//             textCapitalization: textCapitalization,
//             controller: controller,
//             keyboardType: inputType ?? TextInputType.text,
//             inputFormatters: inputFormatters ?? [],
//             cursorColor: AppColors.black,
//             autofocus: autoFocus ?? false,
//             focusNode: focusNode, // Set FocusNode
//             textAlign: textAlign,
//             onTapOutside: (event) {
//               FocusManager.instance.primaryFocus?.unfocus();
//             },
//             onFieldSubmitted: onSubmitted,
//             decoration: InputDecoration(
//               hintText: hint,
//               prefixIcon: prefix,
//               suffixIcon: suffix,
//               fillColor: AppColors.lightGray_2,
//               filled: true,
//               errorText: errorText,
//               hintStyle: TextStyle(
//                 color: AppColors.blackGray,
//                 fontSize: 18,
//                 fontFamily: AppFonts.poppins,
//                 fontWeight: FontWeight.w400,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(width: 1.5, color: AppColors.secondary),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(width: 1.5, color: AppColors.red),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(width: 1.5, color: AppColors.red),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(width: 1.5, color: AppColors.blackGray),
//               ),
//               isDense: true,
//             ),
//             readOnly: readOnly ?? false,
//             style: TextStyle(
//               color: AppColors.blackGray,
//               fontSize: 18,
//               fontFamily: AppFonts.poppins,
//               fontWeight: FontWeight.w400,
//             ),
//             onChanged: onChanged,
//             onTap: onTap,
//             obscureText: isObscure ?? false,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PHAField extends TextFormField {
//   PHAField({
//     Key? key,
//     TextEditingController? controller,
//     required String hint,
//     TextInputType? inputType,
//     List<TextInputFormatter>? inputFormatters,
//     Widget? prefix,
//     ValueChanged<String>? onChanged,
//     bool? isObscure,
//     VoidCallback? onTap,
//     String? errorText,
//     bool? readOnly,
//     bool? autoFocus,
//     Widget? suffix,
//   })  : assert(controller != null, "Controller is required"),
//         super(
//           key: key,
//           controller: controller!,
//           keyboardType: inputType ?? TextInputType.text,
//           inputFormatters: inputFormatters ?? [],
//           cursorColor: AppColors.appBlack,
//           autofocus: autoFocus ?? false,
//           decoration: InputDecoration(
//             hintText: hint,
//             prefixIcon: prefix,
//             suffixIcon: suffix,
//             fillColor: AppColors.fieldColor,
//             filled: true,
//             errorText: errorText,
//             hintStyle: TextStyle(
//               color: AppColors.fieldFontColor,
//               fontSize: 18,
//               fontFamily: AppFonts.poppins,
//               fontWeight: FontWeight.w400,
//             ),
//             border: InputBorder.none,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: AppColors.primary),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: AppColors.appRed),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: AppColors.appRed),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: BorderSide(color: AppColors.transparent),
//             ),
//             isDense: true,
//           ),
//           readOnly: readOnly ?? false,
//           style: TextStyle(
//             color: AppColors.appBlack,
//             fontSize: 18,
//             fontFamily: AppFonts.poppins,
//             fontWeight: FontWeight.w600,
//           ),
//           obscureText: isObscure ?? false,
//           onChanged: onChanged,
//           onTap: onTap,
//         );
// }
//
// class PHAText extends Text {
//   PHAText({
//     Key? key,
//     required String text,
//     TextAlign? textAlign,
//     Color? color,
//     double? fontSize,
//     FontWeight? fontWeight,
//     double? letterSpacing,
//     TextDecoration? textDecoration,
//     TextDecorationStyle? textDecorationStyle,
//     Color? decorationColor,
//   }) : super(
//           text,
//           key: key,
//           textAlign: textAlign ?? TextAlign.left,
//           overflow: TextOverflow.clip,
//           style: TextStyle(
//             color: color ?? AppColors.appBlack,
//             fontFamily: AppFonts.poppins,
//             fontSize: fontSize ?? 9,
//             fontWeight: fontWeight ?? FontWeight.normal,
//             letterSpacing: letterSpacing,
//             decoration: textDecoration,
//             decorationStyle: textDecorationStyle,
//             decorationColor: decorationColor,
//           ),
//         );
// }
