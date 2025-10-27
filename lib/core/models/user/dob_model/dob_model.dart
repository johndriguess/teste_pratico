

import '../../../core.dart';
part 'dob_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class DobModel {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final int age;

  DobModel({
    required this.date, 
    required this.age, 
  });

  factory DobModel.fromJson(Map<String, dynamic> json) => _$DobModelFromJson(json);
  Map<String, dynamic> toJson() => _$DobModelToJson(this);
}