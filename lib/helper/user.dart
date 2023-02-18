import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_cuoi_ki/models/user.dart';

class Useres{
  List<UserModel> users = [];
  Future<void> getUser() async {
    await FirebaseFirestore.instance.
    collection('users')
        .get()
        .then((QuerySnapshot querySnapshot){
          querySnapshot.docs.forEach((doc){
            UserModel user = UserModel(email: doc['email'], password: doc['password'], name: doc['name'], phone: doc['phone']);
            users.add(user);
          });
        });
    print(users[0].phone);
    // // Get docs from collection reference
    // QuerySnapshot querySnapshot = await users.get();
    //
    // // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}