import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'base_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  Future<FirebaseUser> getCurrentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<bool> isEmailVerified() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  @override
  Future<void> sendEmailVerification() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  @override
  Future<String> signIn(String email, String password) async{
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<String> signUp(String email, String password) async{
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  Future<DocumentReference> addDocument(Map data) {
    // TODO: implement addDocument
    return null;
  }

  @override
  Future<QuerySnapshot> getDataCollection() {
    // TODO: implement getDataCollection
    return null;
  }

  @override
  Future<DocumentSnapshot> getDocumentById(String id) {
    // TODO: implement getDocumentById
    return null;
  }

  @override
  Future<void> removeDocument(String id) {
    // TODO: implement removeDocument
    return null;
  }

  @override
  Stream<QuerySnapshot> streamDataCollection() {
    // TODO: implement streamDataCollection
    return null;
  }

  @override
  Future<void> updateDocument(Map data, String id) {
    // TODO: implement updateDocument
    return null;
  }
}