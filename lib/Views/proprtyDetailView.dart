import 'package:pharesidence/Utils/exports/exports.dart';

class PropertyDetailView extends StatelessWidget {
  final Property property;
  const PropertyDetailView({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: property.projectName ?? 'Project Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(), // Add profile-like section
              SizedBox(height: 20),
              _buildDetailCard('Project Name', property.projectName, Icons.work),
              _buildDetailCard('Project ID', property.projectId?.toString(),
                  Icons.fingerprint),
              _buildDetailCard('Registration No.', property.registrationNo,
                  Icons.confirmation_number),
              _buildDetailCard('CNIC', property.cnic, Icons.credit_card),
              _buildDetailCard('Lane No.', property.laneNo, Icons.location_on),
              _buildDetailCard('House No.', property.houseNo, Icons.home),
              _buildDetailCard('Category', property.category, Icons.category),
              _buildDetailCard(
                  'Present Address', property.presentAddress, Icons.place),
              _buildDetailCard('Cell', property.cell, Icons.phone),
              _buildDetailCard('Status', property.status, Icons.info_outline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String? value, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.secondary),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.secondary,
          ),
        ),
        subtitle: Text(
          value ?? 'N/A',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, size: 30, color: Colors.white),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.projectName ?? 'N/A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.secondary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Project ID: ${property.projectId ?? 'N/A'}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}