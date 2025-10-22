
import '../../core.dart';
part 'user_model.g.dart';


@JsonSerializable()
class UserModel {
  final String gender;
  final NameModel name;
  final LocationModel location;
  final String email;
  final LoginModel login;
  final DobModel dob;
  final RegisteredModel registered;
  final String phone;
  final String cell;
  final IdModel id;
  final PictureModel picture;
  final String nat;

  
  UserModel({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  
}