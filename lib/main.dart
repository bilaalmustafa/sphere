import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/AllStore_Screen/AllStore_Provider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_ControllerProvider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Feeds_Screens/Feeds_Controller.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Controller.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Stores_Screens/Stores_Provider.dart';
import 'package:sphere/UI/screens/Buyer_Screen/BuyerScreen.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/UI/screens/Buyer_SellerScreen/BuyerSellerScreen.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/CreateAccount_Screen/CreateAccount.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetial_Provider.dart';
import 'package:sphere/UI/screens/Seller_Screen/SellerScreen.dart';
import 'package:sphere/UI/screens/Seller_Screen/Seller_Provider.dart';
import 'package:sphere/UI/screens/auth/SignUp_Screen/SignUp_Screen.dart';
import 'package:sphere/UI/screens/auth/SignUp_Screen/Signup_Controller.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/LognIn_Screen.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/logIn_controller.dart';
import 'package:sphere/UI/screens/splash_Screens/Splash_Screen.dart';
import 'package:sphere/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomControllerProvider()),
        ChangeNotifierProvider(create: (context) => LogInControllerPrivoder()),
        ChangeNotifierProvider(create: (context) => SignUpControllerPrivoder()),
        ChangeNotifierProvider(create: (context) => StoreProfileProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetialProvider()),
        ChangeNotifierProvider(create: (context) => AllSToreProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => BuyerProvider()),
        ChangeNotifierProvider(create: (context) => SellerProvider()),
        ChangeNotifierProvider(create: (context) => StoreProvider()),
        ChangeNotifierProvider(create: (context) => FeedScreenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/CreateAnAccount': (context) => const CreateAccount(),
          '/SignupScreen': (context) => const SignUpScreen(),
          '/LoginScreen': (context) => const LoginScreen(),
          '/BuyerSeller': (context) => const BuyerSellerScreen(),
          '/NavigationBottomScreen': (context) =>
              const NevigationBottomScreen(),
          '/SellerScreen': (context) => const SellerScreen(),
          '/BuyerScreen': (context) => const BuyerScreen(),
        },
      ),
    );
  }
}
