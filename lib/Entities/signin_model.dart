class SignInModel {
  String? cnic;
  String? name;
  String? mobileNo;
  String? memberType;
  String? token;

  SignInModel({this.cnic, this.name, this.mobileNo, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    cnic = json['cnic'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    memberType = json['memberType'];
    token = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cnic'] = this.cnic;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['memberType'] = this.memberType;
    data['api_token'] = this.token;
    return data;
  }
}