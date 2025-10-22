// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      street: StreetModel.fromJson(json['street'] as Map<String, dynamic>),
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postcode: _postcodeToString(json['postcode']),
      coordinates: CoordinatesModel.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
      timezone: TimezoneModel.fromJson(
        json['timezone'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postcode': instance.postcode,
      'coordinates': instance.coordinates,
      'timezone': instance.timezone,
    };

StreetModel _$StreetModelFromJson(Map<String, dynamic> json) => StreetModel(
  number: (json['number'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$StreetModelToJson(StreetModel instance) =>
    <String, dynamic>{'number': instance.number, 'name': instance.name};

CoordinatesModel _$CoordinatesModelFromJson(Map<String, dynamic> json) =>
    CoordinatesModel(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$CoordinatesModelToJson(CoordinatesModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

TimezoneModel _$TimezoneModelFromJson(Map<String, dynamic> json) =>
    TimezoneModel(
      offset: json['offset'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TimezoneModelToJson(TimezoneModel instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'description': instance.description,
    };
