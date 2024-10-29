class PSIDResponse {
  final bool status;
  final String message;
  final List<PSIDData> data;

  PSIDResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PSIDResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<PSIDData> dataList = list.map((i) => PSIDData.fromJson(i)).toList();

    return PSIDResponse(
      status: json['status'],
      message: json['message'],
      data: dataList,
    );
  }
}

class PSIDData {
  final String psid;

  PSIDData({required this.psid});

  factory PSIDData.fromJson(Map<String, dynamic> json) {
    return PSIDData(
      psid: json['psid'],
    );
  }
}
