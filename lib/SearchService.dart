import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Firestore _firestore = Firestore.instance;
  String ref = 'items';
  Future<List<DocumentSnapshot>> getSearch() async =>
      await _firestore.collection(ref).getDocuments().then((snaps) {
        return snaps.documents;
      });
  Future<List<DocumentSnapshot>> getuserSearch() async =>
      await _firestore.collection('users').getDocuments().then((snaps) {
        return snaps.documents;
      });

  Future<List<DocumentSnapshot>> getSuggestion(String suggestion) async => await _firestore
          .collection(ref)
          .where('items', isEqualTo: suggestion)
          .getDocuments()
          .then((snap) {
        return snap.documents;
      });
}
