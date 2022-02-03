import 'package:hive/hive.dart';
part 'mod_post.g.dart';

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String picture;
  @HiveField(4)
  bool? isActive;
  @HiveField(5)
  String? balance;
  @HiveField(6)
  int? age;
  @HiveField(7)
  String? eyeColor;
  @HiveField(8)
  String? gender;
  @HiveField(9)
  String? company;
  @HiveField(10)
  String? phone;
  @HiveField(11)
  String? address;
  @HiveField(12)
  String? about;

  Post(
      {required this.name,
      required this.email,
      required this.picture,
      this.isActive,
      this.balance,
      this.age,
      this.eyeColor,
      this.gender,
      this.company,
      this.phone,
      this.address,
      this.about});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      // userId: json['_id'],
      name: json['name'],
      email: json['email'],
      picture: json['picture'],
      isActive: json['isActive'],
      balance: json['balance'],
      age: json['age'],
      eyeColor: json['eyeColor'],
      gender: json['gender'],
      company: json['company'],
      phone: json['phone'],
      address: json['address'],
      about: json['about'],
    );
  }
}
