import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class ServicesViews extends StatefulWidget {
  const ServicesViews({super.key});

  @override
  State<ServicesViews> createState() => _ServicesViewsState();
}

class _ServicesViewsState extends State<ServicesViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Services',
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PHAText(
              text: 'Book a Service',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.AppPrimary,
            ),
            SizedBox(height: 20.h),

            // List of Services
            _buildServiceCard('Book a Plumber', Icons.plumbing, () {
              // Add booking logic here
            }),
            SizedBox(height: 15.h),
            _buildServiceCard('Book an Electrician', Icons.electric_bolt, () {
              // Add booking logic here
            }),
            SizedBox(height: 15.h),
            _buildServiceCard('Book a Cleaner', Icons.cleaning_services, () {
              // Add booking logic here
            }),
            SizedBox(height: 15.h),
            _buildServiceCard('Book a Painter', Icons.format_paint, () {
              // Add booking logic here
            }),
            SizedBox(height: 15.h),
            _buildServiceCard('Book a Carpenter', Icons.build, () {
              // Add booking logic here
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.AppSecondary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.AppPrimary.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(15.0),
        leading: Icon(icon, size: 40, color: AppColors.AppPrimary),
        title: PHAText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.AppPrimary,
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.AppPrimary),
      ),
    );
  }
}
