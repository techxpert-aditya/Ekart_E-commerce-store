import 'package:emart/consts/consts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collections
const userCollection = "users";
const productsCollection = "products";
const cartCollection = "cart";
