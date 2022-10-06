
class ModelName {
  ModelName({
    required this.terminalName,
    required this.terminalUuid,
  });
  late final String terminalName;
  late final String terminalUuid;

  ModelName.fromJson(Map<String, dynamic> json){
    terminalName = json['terminal_name'];
    terminalUuid = json['terminal_uuid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['terminal_name'] = terminalName;
    _data['terminal_uuid'] = terminalUuid;
    return _data;
  }
}