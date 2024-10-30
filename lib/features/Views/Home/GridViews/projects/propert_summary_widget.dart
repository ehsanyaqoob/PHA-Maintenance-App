import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Home/GridViews/projects/property_summary.dart';

import '../../home_view.dart';
class PropertySummaryWidget extends StatefulWidget {
  @override
  _PropertySummaryWidgetState createState() => _PropertySummaryWidgetState();
}

class _PropertySummaryWidgetState extends State<PropertySummaryWidget> {
  List<PropertySummary>? propertyData;

  @override
  void initState() {
    super.initState();
    // Simulating data fetching
    _fetchPropertyData();
  }

  Future<void> _fetchPropertyData() async {
    // Here you would typically fetch data from an API or a local database
    // Simulating a delay
    await Future.delayed(Duration(seconds: 2));

    // Simulated response data
    propertyData = [
      PropertySummary(
        image: 'assets/png/icon_gray_structure.svg',
        count: '2',
        type: 'Grey Structure(s)',
      ),
      PropertySummary(
        image: 'assets/png/icon_apartments.svg',
        count: '0',
        type: 'Apartment(s)',
      ),
      PropertySummary(
        image: 'assets/png/icon_commercial.svg',
        count: '0',
        type: 'Commercial(s)',
      ),
    ];

    // Update the UI
    setState(() {});
  }

  Widget _buildPropertiesSummary(List<PropertySummary>? properties) {
    // Check if the properties list is null or empty
    if (properties == null || properties.isEmpty) {
      // Show a SnackBar if no data is available
      Get.snackbar(
        'No Data',
        'No properties data available.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
      return Container(); // Return an empty container if no data
    }

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Properties Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: properties.map((property) {
              return Expanded(
                child: SummaryItem(
                  image: property.image,
                  count: property.count,
                  type: property.type,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Property Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildPropertiesSummary(propertyData),
      ),
    );
  }
}
