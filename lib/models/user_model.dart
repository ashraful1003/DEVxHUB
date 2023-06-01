import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name, email, profile, userId;

  UserModel({
    required this.name,
    required this.email,
    required this.profile,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "profile": profile,
      "userId": userId,
    };
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        name: snapshot["name"],
        email: snapshot["email"],
        profile: snapshot["profile"],
        userId: snapshot["usrId"]);
  }
}
