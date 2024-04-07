class UserModel {
  final String uid;
  String? name;
  String? email;
  double? balance;
  double? totalProfit;

  UserModel.fromUid({required this.uid});

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.balance,
    required this.totalProfit,
  });

  String getUid() => uid;

  String getEmail() => email ?? "";

  String getName() => name ?? "";

  double getBalance() => balance ?? 0;

  double getTotalProfit() => totalProfit ?? 0;

  //Convert this to json format (probably to send to firestore)
  Map<String, dynamic> toJson() => {
        'userId': uid,
        'name': name,
        'email': email,
        'balance': balance,
        'totalProfit': totalProfit,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['userId'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        balance: json['balance'] as double,
        totalProfit: json['totalProfit'] as double,
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
