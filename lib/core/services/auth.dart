import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vogu/core/models/client.dart';
import 'package:vogu/core/models/specialist.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create client obj based on firebase user
  Client _clientFromFirebaseUser(FirebaseUser user) {
    return user != null ? Client(id: user.uid) : null;
  }
  // create specialist obj based on firebase user
  Specialist _specialistFromFirebaseUser(FirebaseUser user) {
    return user != null ? Specialist(id: user.uid) : null;
  }

  // auth change client stream
  Stream<Client> get client {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_clientFromFirebaseUser);
  }

  // auth change specialist stream
  Stream<Specialist> get specialist {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_specialistFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password, bool isSpecialist) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      if (isSpecialist) {
        await Firestore.instance.collection('specialist').document(user.uid).setData({'email': email, 'password': password});
        return _specialistFromFirebaseUser(user);
      } else {
        await Firestore.instance.collection('clients').document(user.uid).setData({'email': email, 'password': password});
        return _specialistFromFirebaseUser(user);
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}