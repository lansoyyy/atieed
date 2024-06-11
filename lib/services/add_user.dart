import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(email, inst, name, bdate, gradelevel, studentnumber, id, img,
    section) async {
  final docUser = FirebaseFirestore.instance
      .collection('Students')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'email': email,
    'inst': inst,
    'name': name,
    'bdate': bdate,
    'gradelevel': gradelevel,
    'studentnumber': studentnumber,
    'type': 'Student',
    'id': docUser.id,
    'class': [],
    'img': img,
    'section': section,
  };

  await docUser.set(json);
}
