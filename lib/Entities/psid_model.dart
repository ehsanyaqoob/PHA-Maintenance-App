//Modify
class PSIDModel {
  String? psid;
  String? pdflink;

  PSIDModel({this.psid, this.pdflink});

  PSIDModel.fromJson(Map<String, dynamic> json) {
    psid = json['psid'];
    pdflink = json['pdflink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['psid'] = this.psid;
    data['pdflink'] = this.pdflink;
    return data;
  }
}