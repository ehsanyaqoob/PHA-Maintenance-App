import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/propertyView.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.white, //Scaffold Background Color
            appBarTheme: AppBarTheme(
             backgroundColor: AppColors.white
            ),
            // textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          ),
          home: SplashView(),
        );
      },
    );
  }
}
