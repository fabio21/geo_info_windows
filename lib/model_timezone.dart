class TimezoneInfo {
  DateTime? datetime;
  int? day;
  List<String>? timeZones;
  String? id;
  int? month;
  String? name;
  String? time;
  String? timeZoneName;
  int? utc;
  int? year;

  TimezoneInfo({
    this.datetime,
    this.day,
    this.timeZones,
    this.id,
    this.month,
    this.name,
    this.time,
    this.timeZoneName,
    this.utc,
    this.year,
  });

  factory TimezoneInfo.fromJson(Map<String, dynamic> json) {
    return TimezoneInfo(
      datetime:
          json['datetime'] != null ? DateTime.parse(json['datetime']) : null,
      day: json['day'] != null ? int.parse(json['day']) : null,
      timeZones: json['time_zones'] != null
          ? List<String>.from(json['time_zones'])
          : null,
      id: json['id'],
      month: json['month'] != null ? int.parse(json['month']) : null,
      name: json['name'],
      time: json['time'],
      timeZoneName: json['time_zone_name'],
      utc: json['utc'] != null ? int.parse(json['utc']) : null,
      year: json['year'] != null ? int.parse(json['year']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['day'] = day;
    data['id'] = id;
    data['month'] = month;
    data['name'] = name;
    data['time'] = time;
    data['time_zone_name'] = timeZoneName;
    data['utc'] = utc;
    data['year'] = year;
    if (timeZones != null) {
      data['fuso_horario_name'] = timeZones;
    }
    return data;
  }
}
