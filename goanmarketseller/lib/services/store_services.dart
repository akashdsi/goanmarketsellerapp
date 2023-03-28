import "package:goanmarketseller/const/const.dart";

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  static getMessages(uid) {
    return firestore
        .collection(chatsCollection)
        .where('toid', isEqualTo: uid)
        .snapshots();
  }

  static getorders(uid) {
    return firestore
        .collection(ordersCollection)
        .where('vendors', arrayContains: uid)
        .snapshots();
  }

  static getproducts(uid) {
    return firestore
        .collection(productCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
  static getPopularProduct(uid){
    return firestore.collection(productCollection).where('vender_id',isEqualTo: uid).orderBy('p_whishlist'.length);

  }
}
