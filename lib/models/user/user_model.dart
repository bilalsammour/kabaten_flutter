import 'package:kabaten/models/map_model.dart';

class UserModel extends MapModel {
  final String id;
  final String fullName;
  final String gender;
  final String phoneNumber;
  final String bio;
  final String? profilePicture;

  const UserModel({
    this.id = '',
    this.fullName = '',
    this.gender = '',
    this.phoneNumber = '',
    this.bio = '',
    this.profilePicture,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? gender,
    String? phoneNumber,
    String? bio,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': fullName,
      'gender': gender,
      'phone_number': phoneNumber,
      'bio': bio,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? '') as String,
      fullName: (map['full_name'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      phoneNumber: (map['phone_number'] ?? '') as String,
      bio: (map['bio'] ?? '') as String,
      profilePicture: map['profile_picture'] != null
          ? map['profile_picture'] as String
          : null,
    );
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
