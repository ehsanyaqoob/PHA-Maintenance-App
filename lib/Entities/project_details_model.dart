
class ProjectDetailsModel {
  String? projectName;
  String? projectImage;
  String? projectLocation;
  String? projectType;
  String? projectCategories;
  String? projectTotalApartments;
  String? projectCompletedPeriod;
  String? projectTotalPrice;
  String? projectDetails;

  ProjectDetailsModel(
      {this.projectName,
        this.projectImage,
        this.projectLocation,
        this.projectType,
        this.projectCategories,
        this.projectTotalApartments,
        this.projectCompletedPeriod,
        this.projectTotalPrice,
        this.projectDetails});

  ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    projectImage = json['project_image'];
    projectLocation = json['project_location'];
    projectType = json['project_type'];
    projectCategories = json['project_categories'];
    projectTotalApartments = json['project_total_apartments'];
    projectCompletedPeriod = json['project_completed_period'];
    projectTotalPrice = json['project_total_price'];
    projectDetails = json['project_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['project_image'] = this.projectImage;
    data['project_location'] = this.projectLocation;
    data['project_type'] = this.projectType;
    data['project_categories'] = this.projectCategories;
    data['project_total_apartments'] = this.projectTotalApartments;
    data['project_completed_period'] = this.projectCompletedPeriod;
    data['project_total_price'] = this.projectTotalPrice;
    data['project_details'] = this.projectDetails;
    return data;
  }
}