import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pico_agent/model/hospital_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPathologyRepository{
  static Future<void> setPathologyData(HospitalModel hospitalModel) async {
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