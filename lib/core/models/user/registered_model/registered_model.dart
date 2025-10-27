import '../../../core.dart';
part 'registered_model.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class RegisteredModel {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final int age;

  RegisteredModel({
    required this.date, 
    required this.age, 
  });

  factory RegisteredModel.fromJson(Map<String, dynamic> json) => _$RegisteredModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteredModelToJson(this);
}