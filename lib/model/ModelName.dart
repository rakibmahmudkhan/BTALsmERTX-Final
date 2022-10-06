

class ModelName {
  String? terminalName;
  String? terminalUuid;

  ModelName({this.terminalName, this.terminalUuid});

  ModelName.fromJson(Map<String, dynamic> json) {
    terminalName = json['terminal_name'];
    terminalUuid = json['terminal_uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terminal_name'] = this.terminalName;
    data['terminal_uuid'] = this.terminalUuid;
    return data;
  }
}