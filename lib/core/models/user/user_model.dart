
import '../../core.dart';
part 'user_model.g.dart';


@HiveType(typeId: 0)
@JsonSerializable()
class UserModel {
  @HiveField(0)
  final String gender;
  @HiveField(1)
  final NameModel name;
  @HiveField(2)
  final LocationModel location;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final LoginModel login;
  @HiveField(5)
  final DobModel dob;
  @HiveField(6)
  final RegisteredModel registered;
  @HiveField(7)
  final String phone;
  @HiveField(8)
  final String cell;
  @HiveField(9)
  final IdModel id;
  @HiveField(10)
  final PictureModel picture;
  @HiveField(11)
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