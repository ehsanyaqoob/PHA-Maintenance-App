import 'package:pharesidence/exports/exports.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.AppPrimary,
            textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          ),
          home: SplashView(),  
        );
      },
    );
  }
}
