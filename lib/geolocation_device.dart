class Geolocation {
  final double? latitude;
  final double? longitude;

  Geolocation({this.latitude, this.longitude});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      latitude: json["latitude"] != null ? double.parse(json["latitude"]) : null,
      longitude: json["longitude"] != null ? double.parse(json["longitude"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
