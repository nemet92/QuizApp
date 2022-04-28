class RegisterDeviceRequestModel {
  String? key;
  String? keyType;
  String? finNumber;

  RegisterDeviceRequestModel({this.key, this.keyType, this.finNumber});

  RegisterDeviceRequestModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    keyType = json['key_type'];
    finNumber = json['fin_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['key_type'] = this.keyType;
    data['fin_number'] = this.finNumber;
    return data;
  }
}
