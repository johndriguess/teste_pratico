import '../../../core.dart';
part 'name_model.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class NameModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String first;
  @HiveField(2)
  final String last;

  NameModel({required this.title, required this.first, required this.last});

  factory NameModel.fromJson(Map<String, dynamic> json) => _$NameModelFromJson(json);
  Map<String, dynamic> toJson() => _$NameModelToJson(this);
}