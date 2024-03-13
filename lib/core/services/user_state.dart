// user_services.dart

import 'package:hive/hive.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/core/helper/generate_token.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_type.dart';

class UserServices {
  static Future<void> saveLoginState(UserModel? userData) async {
    final box = Hive.box<User>('userBox');
    final user = User(
      userType: userData?.userType ?? 'ghost',
      email: userData?.email ?? '',
      whatsState: userData?.whatsappVerified,
      verify: userData?.verified,
      nickName: userData?.nickname ?? 'Ghost',
      username: userData?.name ?? '',
      phoneNumber: userData?.phoneNumber ?? '0',
      token: userData?.userToken ?? generateToken(),
      id: userData?.id ?? 0,
      image: userData?.image ?? "",
      whatsappNumber: userData?.whatsappNumber ?? '',
      lastUpdatePhoneNumber: userData?.lastUpdatePhoneNumber,
      lastUpdateWhatsAppNumber: userData?.lastUpdatePhoneNumber,
      emailState: userData?.emailState ?? 0,
    );
    await box.put('user', user);
  }

  static Future<void> logout() async {
    final box = Hive.box<User>('userBox');
    box.delete('user');
    box.clear();
    box.values.map((element) => element.delete());
    print(box.values.map((element) => element.email));
  }

  static bool checkToken() {
    final box = Hive.box<User>('userBox');
    if (box.isNotEmpty) {
      final boxUser = box.get('user');
      if (boxUser != null &&
          boxUser.token != null &&
          boxUser.token!.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static User getUserInformation() {
    final box = Hive.box<User>('userBox');
    if (box.isNotEmpty) {
      final boxUser = box.get('user');
      print(boxUser?.whatsState);

      if (boxUser != null) {
        print(boxUser.email);
        return boxUser;
      }
    }
    return User(
      userType: 'ghost',
      email: '',
      nickName: '',
      username: 'Ghost',
      phoneNumber: '0',
      verify: 0,
      token: generateToken(),
      id: -1,
      image: '',
      whatsappNumber: '',
      lastUpdatePhoneNumber: DateTime(0),
      lastUpdateWhatsAppNumber: DateTime(0),
      whatsState: 0,
      emailState: 0,
    );
  }

  static Future<void> saveAnonymousState(
      String username,
      String phoneNumber,
      String token,
      int id,
      String image,
      String nickName,
      String email,
      String whatsappNumber,
      DateTime lastUpdatePhoneNumber,
      DateTime lastUpdateWhatsAppNumber,
      int whatsState,
      int emailState,
      String emailVerificationCode,
      int verify) async {
    final box = Hive.box<User>('userBox');
    final user = User(
      userType: 'ghost',
      email: email,
      nickName: nickName,
      image: image,
      username: username,
      phoneNumber: phoneNumber,
      token: token,
      id: id,
      whatsappNumber: whatsappNumber,
      lastUpdatePhoneNumber: lastUpdatePhoneNumber,
      lastUpdateWhatsAppNumber: lastUpdateWhatsAppNumber,
      whatsState: whatsState,
      verify: verify,
      emailState: emailState,
    );
    await box.put('user', user);
  }

  static Future<void> updateUserInfo({
    int? verify,
    String? username,
    String? phoneNumber,
    String? image,
    String? nickName,
    String? email,
    String? whatsappNumber,
    DateTime? lastUpdatePhoneNumber,
    DateTime? lastUpdateWhatsAppNumber,
    int? whatsState,
    int? emailState,
    String? usersType,
  }) async {
    final box = Hive.box<User>('userBox');
    if (box.isNotEmpty) {
      final user = box.values.first;
      print(user.email);
      if (username != null && username.isNotEmpty) {
        print('username: $username');
        user.username = username;
      }
      if (email != null && email.isNotEmpty) {
        user.email = email;
        print('email: $email');
      }
      if (phoneNumber != null && phoneNumber.isNotEmpty) {
        print('phone: $phoneNumber');
        user.phoneNumber = phoneNumber;
      }
      if (image != null && image.isNotEmpty) {
        print('image: $image');
        user.image = image;
      }
      if (nickName != null && nickName.isNotEmpty) {
        print('nickname: $nickName');
        user.nickName = nickName;
      }
      if (whatsappNumber != null && whatsappNumber.isNotEmpty) {
        print('whatsappNumber: $whatsappNumber');
        user.whatsappNumber = whatsappNumber;
      }
      if (lastUpdatePhoneNumber != null &&
          lastUpdatePhoneNumber != DateTime(0)) {
        print('lastUpdatePhoneNumber: $lastUpdatePhoneNumber');
        user.lastUpdatePhoneNumber = lastUpdatePhoneNumber;
      }
      if (lastUpdateWhatsAppNumber != null &&
          lastUpdateWhatsAppNumber != DateTime(0)) {
        print('lastUpdateWhatsAppNumber: $lastUpdateWhatsAppNumber');
        user.lastUpdateWhatsAppNumber = lastUpdateWhatsAppNumber;
      }

      if (whatsState != null) {
        user.whatsState = whatsState;
      }
      if (emailState != null) {
        user.emailState = emailState;
      }
      if (verify != null) {
        user.verify = emailState;
      }
      if (usersType != null) {
        user.userType = usersType;
      }

      await box.put(
          'user',
          User(
              userType: usersType!,
              email: user.email,
              username: user.username,
              phoneNumber: user.phoneNumber,
              image: user.image,
              nickName: user.nickName,
              token: user.token,
              id: user.id,
              whatsappNumber: user.whatsappNumber,
              lastUpdatePhoneNumber: user.lastUpdatePhoneNumber,
              lastUpdateWhatsAppNumber: user.lastUpdateWhatsAppNumber,
              whatsState: user.whatsState,
              emailState: user.emailState,
              verify: user.verify));
    }
  }
}
