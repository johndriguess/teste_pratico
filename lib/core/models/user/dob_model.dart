import '../../core.dart';
part 'dob_model.g.dart';

@JsonSerializable()
class DobModel {
  final String date;
  final int age;

  DobModel({
    required this.date, 
    required this.age, 
  });

  factory DobModel.fromJson(Map<String, dynamic> json) => _$DobModelFromJson(json);
  Map<String, dynamic> toJson() => _$DobModelToJson(this);
}