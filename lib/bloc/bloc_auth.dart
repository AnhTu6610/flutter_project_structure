import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_project_structure/bloc/base_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_project_structure/bloc/base_bloc.dart';
import 'package:flutter_project_structure/bloc/bloc_profile.dart';
import 'package:flutter_project_structure/data_source/local_data/prefs_name.dart';
import 'package:flutter_project_structure/data_source/local_data/prefs_provider.dart';
import 'package:flutter_project_structure/models/base_model/profile_model.dart';
import 'package:flutter_project_structure/services/message_service.dart';
import 'package:logger/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum LoginOption { GOOGLE, FACEBOOK, APPLE }

class BlocAuth extends BaseBloc {
  static Future signOut() async {
    await PrefsProvider.removeAll();
    try {
      await GoogleSignIn().signOut();
    } catch (e) {}
    try {
      await FacebookAuth.instance.logOut();
    } catch (e) {}
    try {} catch (e) {}
    await MessageService.resetToken();
  }

  Future<bool> handleLoginSocial(LoginOption option) async {
    UserCredential? userCredential;
    showLoading();
    try {
      switch (option) {
        case LoginOption.GOOGLE:
          userCredential = await signInWithGoogle();
          break;
        case LoginOption.FACEBOOK:
          userCredential = await signInWithFacebook();
          break;
        case LoginOption.APPLE:
          userCredential = await signInWithApple();
          break;
      }
    } catch (error) {
      print(error);
    }

    // print("login profile : ${userCredential?.additionalUserInfo?.profile}");
    if (userCredential != null) {
      Profile profile = new Profile(
        uid: userCredential.user!.uid,
        displayName: userCredential.user!.displayName,
        photoURL: userCredential.user!.photoURL,
      );
      // var tokenSevice = await userCredential.user!.getIdToken();
      // print("========= $tokenSevice");
      await PrefsProvider.setString(PrefsNames.PROFILE, jsonEncode(profile.toJson()));
      // await BlocProfile().updateProfile(profile);
      // GlobalObject.profile = profile;
      hideLoading();
      return true;
    }
    showError("Đăng nhập không thành công\nVui lòng thử lại");
    return false;
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    Logger().i(result.status, "Login facebook state");
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      final facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
    return null;
  }

  Future<UserCredential?> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
