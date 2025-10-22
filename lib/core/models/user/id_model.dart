import '../../core.dart';
part 'id_model.g.dart';

@JsonSerializable()
class IdModel {
  final String name;
  final String value;

  IdModel({
    required this.name, 
    required this.value, 
  });

  factory IdModel.fromJson(Map<String, dynamic> json) => _$IdModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdModelToJson(this);
}