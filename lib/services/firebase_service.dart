import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  static FirebaseService? _instance;

  static FirebaseService get instance {
    _instance ??= FirebaseService();
    return _instance!;
  }

  final User? user = FirebaseAuth.instance.currentUser;

}