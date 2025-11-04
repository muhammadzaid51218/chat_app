import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestoreservice.dart' show FirestoreService;


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  User? get currentUser => _auth.currentUser;
  String? get currentUserId => _auth.currentUser?.uid;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserModel?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user != null) {
        await _firestoreService.updateUserOnlineStatus(user.uid, true);
        return await _firestoreService.getUser(user.uid);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to Sign In ${e.toString()}");
    }
  }

  Future<UserModel?> registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user != null) {
        await _firestoreService.updateDisplayName(displayName);
        final userModel = UserModel(
          id: user.uid,
          email: email,
          displayName: displayName,
          lastSeen: DateTime.now(),
          isOnline : true,
          photoURL: '',
          createdAt: DateTime.now(),
        );
        await _firestoreService.createUser(userModel);
        return userModel;
      }
      return null;
    } catch (e) {
      throw Exception("Failed to Register ${e.toString()}");
    }
  }

  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      throw Exception("Failed to Send Password Reset Email ${e.toString()}");
    }
  }

  Future<void> signOut() async{
    try{
      if(currentUser != null){
        await _firestoreService.updateUserOnlineStatus(currentUserId!,false);
      }
      _auth.signOut();
    }catch(e){
      throw Exception("Failed to Send Password Reset Email ${e.toString()}");
    }
  }

  Future<void> deleteAccount() async{
    try{
      User? user = _auth.currentUser;
      if(user != null){
        await _firestoreService.deleteUser(user.uid);
        await user.delete();
      }
    }catch(e){
      throw Exception("Failed to Delete Account ${e.toString()}");
    }
  }

  Future<UserModel?> getUserFromFirestore(String uid) async {
    return await _firestoreService.getUser(uid);
  }
}
