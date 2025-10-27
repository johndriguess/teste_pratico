import '../../../core.dart';
part 'picture_model.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class PictureModel {
  @HiveField(0)
  final String large;
  @HiveField(1)
  final String medium;
  @HiveField(2)
  final String thumbnail;

  PictureModel({
    required this.large, 
    required this.medium, 
    required this.thumbnail
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);
  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}