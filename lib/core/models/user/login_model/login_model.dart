import '../../../core.dart';
part 'login_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class LoginModel {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String salt;
  @HiveField(4)
  final String md5;
  @HiveField(5)
  final String sha1;
  @HiveField(6)
  final String sha256;

  LoginModel({
    required this.uuid, 
    required this.username, 
    required this.password, 
    required this.salt, 
    required this.md5, 
    required this.sha1, 
    required this.sha256, 
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}