class SignInModel {
  String? cnic;
  String? name;
  String? mobileNo;
  String? category;
  String? memberType;
  String? token;

  SignInModel({this.cnic, this.name, this.mobileNo, this.category, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    cnic = json['cnic'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    category = json['category'];
    memberType = json['memberType'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cnic'] = this.cnic;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['category'] = this.category;
    data['memberType'] = this.memberType;
    data['token'] = this.token;
    return data;
  }
}