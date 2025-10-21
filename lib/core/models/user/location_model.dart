class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final String postcode; 
  final CoordinatesModel coordinates;
  final TimezoneModel timezone;

  LocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street: StreetModel.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: CoordinatesModel.fromJson(json['coordinates']),
      timezone: TimezoneModel.fromJson(json['timezone']),
    );
  }
}

class StreetModel {
  final int number;
  final String name;

  StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson(Map<String, dynamic> json) {
    return StreetModel(
      number: json['number'],
      name: json['name'],
    );
  }
}

class CoordinatesModel {
  final String latitude;
  final String longitude;

  CoordinatesModel({required this.latitude, required this.longitude});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class TimezoneModel {
  final String offset;
  final String description;

  TimezoneModel({required this.offset, required this.description});

  factory TimezoneModel.fromJson(Map<String, dynamic> json) {
    return TimezoneModel(
      offset: json['offset'],
      description: json['description'],
    );
  }
}