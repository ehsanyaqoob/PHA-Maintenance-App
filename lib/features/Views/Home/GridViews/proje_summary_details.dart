import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import '../../../../Shared/Controllers.dart/project_controller.dart';
import '../home_view.dart';
import 'projects/projects_views.dart';

class PropertySummaryScreen extends StatefulWidget {
  final String cnic;

  PropertySummaryScreen({required this.cnic});

  @override
  _PropertySummaryScreenState createState() => _PropertySummaryScreenState();
}

class _PropertySummaryScreenState extends State<PropertySummaryScreen> {
  
    final ProjectsViewController controller = Get.put(ProjectsViewController());

  List<dynamic> properties = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProjectData();
  }

void _fetchProjectData() {
  controller.fetchProjects(widget.cnic).then((_) {
    setState(() {
      isLoading = false;
    });
  }).catchError((error) {
    setState(() {
      isLoading = false;
    });
    Get.snackbar(
      'Error',
      'Failed to fetch projects: $error',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  });
}


  Widget _buildPropertiesSummary() {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PHAText(
                  text: 'Properties Summary',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display summary items based on the fetched properties data
                    Expanded(
                      child: SummaryItem(
                        image: 'assets/png/icon_gray_structure.svg',
                        count: properties.length.toString(),
                        type: 'Total Properties',
                        onTap: () {
                          _showPropertyDetails();
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SummaryItem(
                        image: 'assets/png/icon_under_construction.svg',
                        count: properties.where((p) => p['status'] == 'Under Construction').length.toString(),
                        type: 'Under Construction',
                        onTap: () {
                          _showFilteredPropertyDetails('Under Construction');
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SummaryItem(
                        image: 'assets/png/icon_completed.svg',
                        count: properties.where((p) => p['status'] == 'Completed').length.toString(),
                        type: 'Completed',
                        onTap: () {
                          _showFilteredPropertyDetails('Completed');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  void _showPropertyDetails() {
    Get.to(
      ProjectsViews(cnic: widget.cnic),
      arguments: properties, // Pass all properties
    );
  }

  void _showFilteredPropertyDetails(String status) {
    final filteredProperties = properties.where((p) => p['status'] == status).toList();
    Get.to(
      ProjectsViews(cnic: widget.cnic),
      arguments: filteredProperties, // Pass filtered properties
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPropertiesSummary(),
    );
  }
}
