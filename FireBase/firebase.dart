
final CollectionReference donor =
      FirebaseFirestore.instance.collection('Users');
//-------------------------------------------------------------------- Add Donor
 void addDonor() {
    final data = {
      'name': 'Athul',
      'phone': 9744690056,
      'blood': 'b-',
    };
    donor.add(data);
  }
//-------------------------------------------------------------------- Update Donor
void UpdateDonors(docid) {
  final data = {
    'name': donorName.text,
    'phone': donorPhone.text,
    'blood': selectedGroop,
  };
  donor.doc(docid).update(data);
}
//-------------------------------------------------------------------- Delete Donor
void deleteDonor(docId) {
  donor.doc(docId).delete();
}
//-------------------------------------------------------------------- read Donor
 final DocumentSnapshot donorSnap = snapshot.data.docs[index];
Text(donorSnap['phone'].toString() != null
                        ? donorSnap['phone'].toString()
                        : 'no phone number'),

//-------------------------------------------------------------------- 








































class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
//-----------------------------------------------------------------------------Sign in
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

//-----------------------------------------------------------------------------create User
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

//-----------------------------------------------------------------------------log Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

