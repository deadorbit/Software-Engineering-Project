class UserModel {
  final String uid;
  String? name;
  String? email;

  UserModel.fromUid({required this.uid});

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  String getName() => name ?? ""; // Handle potential null values

  String getUid() => uid;

  String getEmail() => email ?? ""; // Handle potential null values

  //Convert this to json format (probably to send to firestore)
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
  );

  //Save user model to firestore
  Future<void> createUser(usersCollection) async {
    await usersCollection.doc(uid).set(toJson());
  }

  //Retreieve UserModel from FirebaseFirestore database 
  Future<UserModel> fetchUser(usersCollection) async {
    final doc = await usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception('User not found');
    }
  }

  //Update User Model
  Future<void> updateUser(usersCollection) async {
    await usersCollection.doc(uid).update(toJson());
  }
}