// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hackathon_04_2021_shekels/core/app_models/result_app_model.dart';

// class FunctionUtils {
//   static Future<ResultAppModel> execFirebaseAuthFunction(
//     Future<void> Function() function,
//   ) async {
//     try {
//       await function();
//       return ResultAppModel(isSuccess: true);
//     } on FirebaseAuthException catch (firebaseAuthException) {
//       return handleFirebaseAuthException(firebaseAuthException);
//     } catch (e) {
//       return ResultAppModel(
//         isSuccess: false,
//         errorMessage: e.htmlContent ?? 'Something went wrong',
//       );
//     }
//   }

//   static ResultAppModel handleFirebaseAuthException(
//     FirebaseAuthException exception,
//   ) {
//     String message = _firebaseAuthCodeWithMessage[exception.code];

//     return ResultAppModel(
//       isSuccess: false,
//       errorMessage: message ?? exception.message ?? 'Something went wrong',
//     );
//   }
// }

// Map<String, String> _firebaseAuthCodeWithMessage = {
//   // SignIn with email
//   'user-not-found': 'Sorry, we cannot find an account with that email address.',
//   'wrong-password': 'The password you entered is incorrect. Please try again.',
//   'invalid-email': 'The email address you entered is invalid.',
//   'user-disabled': 'Sorry, the account has been disabled.',
//   // SignUp with email
//   'email-already-in-use': 'Sorry, the email address is already in used.',
//   'weak-password': 'Sorry, the password is too weak.',
//   // SignIn with Credential
//   'account-exists-with-different-credential':
//       'Sorry, the email address is already used by different account.',
//   // Update phone number
//   'invalid-phone-number': 'Sorry, the provided phone number is not valid.',
//   'invalid-verification-code': 'Sorry, the verification code is invalid.',
// };
