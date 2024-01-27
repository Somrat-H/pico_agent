import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pico_agent/common/constant.dart';
import 'package:pico_agent/model/doctor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/hospital_model.dart';

class AuthService {
  static Future<bool> login(
      {required String userNameController,
      required String passwordController}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController,
        password: passwordController,
      );

      final uId = credential.user!.uid;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uId.toString());

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      return false;
    }
  }
   static Future<bool> logout(
      ) async {
    try {
      final credential = await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == '') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      return false;
    }
  }
  static Future<HospitalModel?> getHospitaldata() async {
    // DocumentReference docRef = collectionRef.doc('userid to fetch hospital details');
    final _firestore = FirebaseFirestore.instance;
    final prefs = await SharedPreferences.getInstance();
    final userid = await prefs.get('uid');
    final snapshot = await _firestore
        .collection('hospitals')
        .where("id", isEqualTo: userid)
        .get();
    if (snapshot.docs.isNotEmpty) {
      final hospital =
          snapshot.docs.map((e) => HospitalModel.fromJson(e.data())).single;
      return hospital;
    }
    return null;
  }

  static Future<void> setHospitalData(HospitalModel hospitalModel) async {
    // DocumentReference docRef = collectionRef.doc('userid to fetch hospital details');
    final _firestore = FirebaseFirestore.instance;
    final prefs = await SharedPreferences.getInstance();
    final userid = await prefs.get('uid');

    final snapshot = await _firestore
        .collection('hospitals')
        .doc(userid.toString())
        .set(hospitalModel.toJson());
  }

  static Future<void> setDoctorData(HospitalModel hospitalModel) async {
    // DocumentReference docRef = collectionRef.doc('userid to fetch hospital details');
    final _firestore = FirebaseFirestore.instance;
    final prefs = await SharedPreferences.getInstance();
    final userid = await prefs.get('uid');

    final snapshot = await _firestore
        .collection('hospitals')
        .doc(userid.toString())
        .update(hospitalModel.toJson());
  }
}
