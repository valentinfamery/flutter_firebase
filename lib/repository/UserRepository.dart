import '../models/user_firestore.dart';

abstract class UserRepository {
  Future<void> addUserToFirebase(String email, String password, String text);
}
