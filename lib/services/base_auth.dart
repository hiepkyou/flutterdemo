import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


abstract class BaseAuth {
  Future<String> signIn (String email, String password);

  Future<String> signUp (String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<QuerySnapshot> getDataCollection();

  Stream<QuerySnapshot> streamDataCollection();

  Future<DocumentSnapshot> getDocumentById(String id);

  Future<void> removeDocument(String id);

  Future<DocumentReference> addDocument(Map data) ;

  Future<void> updateDocument(Map data , String id);
}