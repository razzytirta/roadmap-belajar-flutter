import 'package:flutter/material.dart';

/// Class UserProfile digunakan untuk menampilkan user profile ke layar dengan indah
class UserProfile extends StatelessWidget {
  /// field name digunakan untuk menyimpan nama user
  final String? name;
  final String? role;
  final String? photoURL;

  /// *[name] berisi *nama user*. Nilai defaultnya adalah `No name`
  ///
  /// *[role] berisi peran/jabatan dari user. Nilai defaultnya adalah `No role`
  ///
  /// *[photoURl] berisi **foto user**. Nilai defaultnya adalah `null`
  ///
  ///Contoh :
  ///```
  ///  final UserProfile profile = UserProfile(
  ///  name: "Razzi",
  ///  role: "Admin",
  ///  photoURL:
  ///      "https://cdn1.iconfinder.com/data/icons/user-avatar-20/64/18-man-512.png",
  /// );
  /// ```
  UserProfile({
    super.key,
    this.name = "No Name",
    this.role = "No Role",
    this.photoURL,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage((photoURL != null)
              ? photoURL.toString()
              : "https://cdn0.iconfinder.com/data/icons/general-blueline/96/profile-512.png"),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "[ $role ]",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
