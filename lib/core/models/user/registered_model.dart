import '../../core.dart';
part 'registered_model.g.dart';

@JsonSerializable()
class RegisteredModel {
  final String date;
  final int age;

  RegisteredModel({
    required this.date, 
    required this.age, 
  });

  factory RegisteredModel.fromJson(Map<String, dynamic> json) => _$RegisteredModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteredModelToJson(this);
}