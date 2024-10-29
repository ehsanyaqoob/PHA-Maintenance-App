// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pharesidence/exports/exports.dart';

class PHAText extends Text {
  PHAText({
    super.key,
    required String text,
    TextAlign textAlign = TextAlign.left,
    Color color = Colors.black,
    double fontSize = 9,
    FontWeight fontWeight = FontWeight.normal,
    double? letterSpacing,
    TextDecoration? textDecoration,
    TextDecorationStyle? textDecorationStyle,
    Color? decorationColor,
    String font = 'Poppins',
    int? maxLines, // Make maxLines optional
    TextOverflow? overflow, // Make overflow optional
  }) : super(
          text,
          textAlign: textAlign,
          overflow: overflow ?? TextOverflow.ellipsis, // Default to ellipsis
          maxLines: maxLines ?? 2, // Default to 2 lines
          style: TextStyle(
            color: color,
            fontFamily: font,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            decoration: textDecoration,
            decorationStyle: textDecorationStyle,
            decorationColor: decorationColor,
          ),
        );
}

class PHATextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String title;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final ValueChanged<String>? onChanged;
  final bool? isObscure;
  final VoidCallback? onTap;
  final String? errorText;
  final bool? readOnly;
  final bool? autoFocus;
  final Widget? suffix;
  final double? topPadding;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? validator;
  final String? initialValue;

  PHATextFormField({
    Key? key,
    this.controller,
    required this.hint,
    this.title = '',
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
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title.isNotEmpty,
            child: PHAText(
              text: title,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.appBlack,
            ),
          ),
          SizedBox(height: title.isNotEmpty ? 4 : 4),
          TextFormField(
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            controller: controller,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            cursorColor: AppColors.AppPrimary,
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
              fillColor: const Color(0xffE7EBEC),
              filled: true,
              errorText: errorText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
                fontFamily: AppFonts.poppins,
                fontWeight: FontWeight.w400,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.greycolor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Color(0xffB3B3B3),
                ),
              ),
              isDense: true,
            ),
            readOnly: readOnly ?? false,
            style: TextStyle(
              color: AppColors.appBlack,
              fontSize: 14.sp,
              fontFamily: AppFonts.poppins,
              fontWeight: FontWeight.w500,
            ),
            onChanged: onChanged,
            onTap: onTap,
            obscureText: isObscure ?? false,
            validator: validator,
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends TextFormField {
  CustomTextField({
    super.key,
    TextEditingController? controller,
    required String hint,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    Widget? prefix,
    super.onChanged,
    bool? isObscure,
    super.onTap,
    String? errorText,
    bool? readOnly,
    bool? autoFocus,
    Widget? suffix,
  })  : assert(controller != null, "Controller is required"),
        super(
          controller: controller!,
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          cursorColor: AppColors.appBlack,
          autofocus: autoFocus ?? false,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefix,
            suffixIcon: suffix,
            fillColor: Colors.grey[200],
            filled: true,
            errorText: errorText,
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontFamily: AppFonts.poppins,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            isDense: true,
          ),
          readOnly: readOnly ?? false,
          style: TextStyle(
            color: AppColors.appBlack,
            fontSize: 18,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
          ),
          obscureText: isObscure ?? false,
        );
}
