// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  gender: json['gender'] as String,
  name: NameModel.fromJson(json['name'] as Map<String, dynamic>),
  location: LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  email: json['email'] as String,
  login: LoginModel.fromJson(json['login'] as Map<String, dynamic>),
  dob: DobModel.fromJson(json['dob'] as Map<String, dynamic>),
  registered: RegisteredModel.fromJson(
    json['registered'] as Map<String, dynamic>,
  ),
  phone: json['phone'] as String,
  cell: json['cell'] as String,
  id: IdModel.fromJson(json['id'] as Map<String, dynamic>),
  picture: PictureModel.fromJson(json['picture'] as Map<String, dynamic>),
  nat: json['nat'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'gender': instance.gender,
  'name': instance.name,
  'location': instance.location,
  'email': instance.email,
  'login': instance.login,
  'dob': instance.dob,
  'registered': instance.registered,
  'phone': instance.phone,
  'cell': instance.cell,
  'id': instance.id,
  'picture': instance.picture,
  'nat': instance.nat,
};
