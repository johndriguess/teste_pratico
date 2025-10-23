import '../../core.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  @JsonKey(fromJson: _postcodeToString)
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

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class StreetModel {
  final int number;
  final String name;

  StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson(Map<String, dynamic> json) => _$StreetModelFromJson(json);
  Map<String, dynamic> toJson() => _$StreetModelToJson(this);
}

@JsonSerializable()
class CoordinatesModel {
  final String latitude;
  final String longitude;

  CoordinatesModel({required this.latitude, required this.longitude});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) => _$CoordinatesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);
}

@JsonSerializable()
class TimezoneModel {
  final String offset;
  final String description;

  TimezoneModel({required this.offset, required this.description});

  factory TimezoneModel.fromJson(Map<String, dynamic> json) => _$TimezoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimezoneModelToJson(this);
}

//Api as vezes retornava o código postal como int e as vezes String, essa função serve para prever essa situação e contorna-la
String _postcodeToString(dynamic postcode) {
  //log para debug
  //log(postcode.runtimeType.toString());
  return postcode.toString();
}