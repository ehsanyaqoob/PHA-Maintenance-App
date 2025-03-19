import 'package:pharesidence/Utils/exports/exports.dart';

class PropertyViews extends StatefulWidget {
  const PropertyViews({super.key});
  @override
  State<PropertyViews> createState() => _PropertyViewsState();
}

class _PropertyViewsState extends State<PropertyViews> {
  var controller = Get.find<PropertyController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(() => Stack(
          children: [
            AppBackground(),
            AppBackButton(title: 'Property Dashboard'),
            Positioned(
              top: 35.h + 24,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Column(
                  children: [
                    Visibility(
                      visible: controller.user.value.memberType != 'owner',
                      child: Column(
                        children: [
                          PHATextFormField(
                            hint: AppConstants.typeYourMembership,
                            title: AppConstants.enterYourMembership,
                            onSubmitted: (value) =>
                                controller.onSubmitMembership(value),
                            prefix: TextFieldIcon(
                                icon: AppAssets.imgCNIC,
                                color: AppColors.lightGray_1),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: controller.listOfProperties
                            .map((property) =>
                            PropertyItem(property: property))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible:
                  controller.listOfProperties.length == 0 ? true : false,
                  child: PHAText(
                    text: 'No Property Found',
                    color: AppColors.blackGray.withOpacity(0.7),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ),

            // Align(
            //   alignment: Alignment.center,
            //   child: Visibility(
            //       visible: controller.isBusy.value, child: PHALoader()))
          ],
        )),
      ),
    );
  }
}
