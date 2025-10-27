import '../../../core.dart';
part 'location_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class LocationModel {
  @HiveField(0)
  final StreetModel street;
  @HiveField(1)
  final String city;
  @HiveField(2)
  final String state;
  @HiveField(3)
  final String country;
  @HiveField(4)
  @JsonKey(fromJson: _postcodeToString)
  final String postcode; 
  @HiveField(5)
  final CoordinatesModel coordinates;
  @HiveField(6)
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

@HiveType(typeId: 9)
@JsonSerializable()
class StreetModel {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String name;

  StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson(Map<String, dynamic> json) => _$StreetModelFromJson(json);
  Map<String, dynamic> toJson() => _$StreetModelToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class CoordinatesModel {
  @HiveField(0)
  final String latitude;
  @HiveField(1)
  final String longitude;

  CoordinatesModel({required this.latitude, required this.longitude});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) => _$CoordinatesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);
}

@HiveType(typeId: 10)
@JsonSerializable()
class TimezoneModel {
  @HiveField(0)
  final String offset;
  @HiveField(1)
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