import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class ServicesViews extends StatefulWidget {
  const ServicesViews({super.key});

  @override
  State<ServicesViews> createState() => _ServicesViewsState();
}

class _ServicesViewsState extends State<ServicesViews> {
  final List<Map<String, dynamic>> services = [
    {'title': 'Book a Plumber', 'icon': 'assets/png/plumber.png'},
    {'title': 'Book an Electrician', 'icon': 'assets/png/electrician.png'},
    {'title': 'Book a Cleaner', 'icon': 'assets/png/cleaner.png'},
    {'title': 'Book a Painter', 'icon': 'assets/png/painter.png'},
    {'title': 'Book a Carpenter', 'icon': 'assets/png/carpainter.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Services',
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                'assets/png/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PHAText(
                  textAlign: TextAlign.center,
                  text: 'Book a Service',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: GridView.builder(
                    itemCount: services.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      crossAxisSpacing: 15.0, // Spacing between columns
                      mainAxisSpacing: 15.0, // Spacing between rows
                      childAspectRatio: 1, // Adjust item height/width ratio
                    ),
                    itemBuilder: (context, index) {
                      return _buildServiceCard(
                        services[index]['title'],
                        services[index]['icon'],
                        () {
                          // Add booking logic here
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String iconPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            PHAText(
              text: title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
