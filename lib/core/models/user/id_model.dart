import '../../core.dart';
part 'id_model.g.dart';

@JsonSerializable()
class IdModel {
  final String name;
  //Api retornava value == Null as vezes, sendo assim declarei a variavel como nullable
  final String? value;

  IdModel({
    required this.name, 
    required this.value, 
  });

  factory IdModel.fromJson(Map<String, dynamic> json) => _$IdModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdModelToJson(this);
}

