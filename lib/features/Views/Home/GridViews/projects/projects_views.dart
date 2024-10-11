import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:shimmer/shimmer.dart';
import 'preview_dialog.dart';


class Project {
  final String name;
  final List<String> properties; // List of properties for the project

  Project({
    required this.name,
    required this.properties, // Added property list
  });
}

class ProjectsViews extends StatefulWidget {
  const ProjectsViews({super.key});

  @override
  State<ProjectsViews> createState() => _ProjectsViewsState();
}

class _ProjectsViewsState extends State<ProjectsViews> {
  bool _isLoading = true;

  final List<Project> projects = [
    Project(
      name: 'Kurri Road',
      properties: ['House 12', 'House 18', 'House 23', 'Apartment 5A', 'Apartment 23B'],
    ),
    Project(
      name: 'I 11 /3',
      properties: ['House 50', 'House 52', 'House 58', 'Apartment 3C'],
    ),
    Project(
      name: 'Lahore City',
      properties: ['House 20', 'House 25', 'Apartment 5B'],
    ),
    Project(
      name: 'Karachi City',
      properties: ['House 10', 'House 12', 'Apartment 7A'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Property Dashboard',
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProjectList(projects),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectList(List<Project> projectList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PHAText(
          text: 'Your Properties',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.AppPrimary,
        ),
        SizedBox(height: 10.h),
        Container(
          height: 300, // Set a fixed height for scrollable content
          child: _isLoading
              ? _buildShimmerEffect() // Show shimmer effect while loading
              : ListView.builder(
                  itemCount: projectList.length,
                  itemBuilder: (context, index) {
                    return _buildPropertiesRow(projectList[index]);
                  },
                ),
        ),
      ],
    );
  }

  // Shimmer effect for loading placeholder
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 3, // Show 3 shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150.w,
                  height: 20.h,
                  color: Colors.grey.shade300,
                ),
                Container(
                  width: 20.w,
                  height: 20.h,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPropertiesRow(Project project) {
    return InkWell(
      onTap: () {
        _navigateToPropertiesDetail(project);
      },
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PHAText(
              text: project.name,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.AppPrimary,
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.AppPrimary, size: 18),
          ],
        ),
      ),
    );
  }

  // Navigation function using GetX
  void _navigateToPropertiesDetail(Project project) {
    Get.to(() => ProjectDetailView(project: project));
  }
}

class ProjectDetailView extends StatefulWidget {
  final Project project;

  const ProjectDetailView({super.key, required this.project});

  @override
  _ProjectDetailViewState createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  String? _selectedProperty; // Track the selected property for payment

  // Simulate generated PSID list (2-3 randoms)
  final List<String> psidList = [
    'PSID 123456789',
    'PSID 987654321',
    'PSID 456789123',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.project.name,
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project name
            PHAText(
              text: widget.project.name,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.AppPrimary,
            ),
            SizedBox(height: 10.h),

            // Dropdown to select the property
            DropdownButton<String>(
              value: _selectedProperty,
              hint: Text('Select Property'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProperty = newValue;
                });
              },
              items: widget.project.properties.map<DropdownMenuItem<String>>((String property) {
                return DropdownMenuItem<String>(
                  value: property,
                  child: Text(property),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),

            // Display selected property details
            if (_selectedProperty != null)
              Text(
                'Selected Property: $_selectedProperty',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: PHAButton(
                      title: 'Pay',
                      fillColor: true,
                      onTap: () {
                        if (_selectedProperty != null) {
                          Get.to(() => PaymentView());
                        } else {
                          Get.snackbar('Error', 'Please select a property for payment');
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: PHAButton(
                      title: 'Generate Bill',
                      fillColor: true,
                      onTap: () {
                        if (_selectedProperty != null) {
                          showDialog(
                            context: context,
                            barrierDismissible: false, // Prevent dialog from closing on outside tap
                            builder: (BuildContext context) {
                              return PaymentPreviewDialog(
                                personName: 'MRS. AMIR JAN',
                                propertyName: _selectedProperty!,
                                PSID: '1017867543234556',
                                billDate: '2024-09-30',
                                dueDate: '2024-10-30',
                                amountDue: 150.75,
                                lateFee: 5.00,
                                totalAmount: 155.75,
                                billingPeriod: 'Sep 2024',
                                paymentMethod: 'Credit Card',
                                apartmentName: _selectedProperty!, // Provide apartment/house name
                                ownerName: 'MRS. AMIR JAN', // Provide owner name
                                category: 'C', // Provide category (C/D/B)
                                onProceedPayment: () {
                                  Navigator.of(context).pop(); // Close the current dialog

                                  // Show a new dialog with Pay and Download buttons
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false, // Prevent dialog from closing on outside tap
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Payment Options'),
                                        content: Text('What would you like to do next?'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle Pay action
                                              Navigator.of(context).pop(); // Close the dialog
                                              Get.to(() => PaymentView()); // Navigate to payment page
                                            },
                                            child: Text('Pay'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle Download action
                                              Navigator.of(context).pop(); // Close the dialog
                                              // Implement download logic here
                                            },
                                            child: Text('Download Bill'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          Get.snackbar('Error', 'Please select a property for bill generation');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
      ),
      body: Center(
        child: Text('Payment options will be displayed here.'),
      ),
    );
  }
}
