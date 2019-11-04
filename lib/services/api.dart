import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'base_auth.dart';


class Api implements BaseAuth{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path){
    ref = _db.collection(path);
  }

  @override
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  @override
  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }

  @override
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }

  @override
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  @override
  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  @override
  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data) ;
  }


  @override
  Future<String> signIn(String email, String password) {
    // TODO: implement signIn
    return null;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    return null;
  }

  @override
  Future<String> signUp(String email, String password) {
    // TODO: implement signUp
    return null;
  }

  @override
  Future<bool> isEmailVerified() {
    // TODO: implement isEmailVerified
    return null;
  }


  @override
  Future<FirebaseUser> getCurrentUser() {
    // TODO: implement getCurrentUser
    return null;
  }

    @override
    Future<void> sendEmailVerification() {
      // TODO: implement sendEmailVerification
      return null;
    }
  }