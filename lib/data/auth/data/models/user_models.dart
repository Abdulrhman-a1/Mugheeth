import '../../domain/entities/user.dart';

class UserModels extends User {
  UserModels({
    required super.id,
    required super.email,
    required super.name,
    required super.Bdate,
    required super.gender,
  });

  factory UserModels.fromJson(Map<String, dynamic> map) {
    return UserModels(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      Bdate: map['Bdate'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  UserModels copyWith({
    String? id,
    String? email,
    String? name,
    String? Bdate,
    String? gender,
  }) {
    return UserModels(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      Bdate: Bdate ?? this.Bdate,
      gender: gender ?? this.gender,
    );
  }
}
