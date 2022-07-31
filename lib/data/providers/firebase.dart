import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  Future<Map<String, dynamic>?> getConfig() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var config = await firestore.collection('config').doc('1').get();

    return config.data();
  }
}
