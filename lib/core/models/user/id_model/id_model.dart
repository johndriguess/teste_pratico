import '../../../core.dart';
part 'id_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class IdModel {
  @HiveField(0)
  final String name;
  //Api retornava value == Null as vezes, sendo assim declarei a variavel como nullable
  @HiveField(1)
  final String? value;

  IdModel({
    required this.name, 
    required this.value, 
  });

  factory IdModel.fromJson(Map<String, dynamic> json) => _$IdModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdModelToJson(this);
}

