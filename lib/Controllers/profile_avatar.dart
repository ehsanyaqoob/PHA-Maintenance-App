import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharesidence/Utils/Theme/app_colors.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ProfileController to manage avatar-related operations
class ProfileController extends GetxController {
  var avatarPath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadAvatar();
  }

  Future<void> captureFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _saveAvatar(pickedFile.path);
    }
  }

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _saveAvatar(pickedFile.path);
    }
  }

  Future<void> deleteAvatar() async {
    _saveAvatar('');
  }

  Future<void> _saveAvatar(String path) async {
    avatarPath.value = path;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('avatarPath', path);
  }

  Future<void> _loadAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    avatarPath.value = prefs.getString('avatarPath') ?? '';
  }
}

// Custom bottom sheet widget for reuse
class CustomBottomSheet extends StatelessWidget {
  final Widget? header;
  final Widget? content;
  final Widget? footer;

  const CustomBottomSheet({
    Key? key,
    this.header,
    this.content,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null) header!,
          if (content != null) content!,
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
