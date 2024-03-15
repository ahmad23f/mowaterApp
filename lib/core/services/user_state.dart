// user_services.dart

import 'package:Mowater/core/helper/generate_token.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/services/user_hive_model.dart';
import 'package:hive/hive.dart';

class UserServices {
  static Future<void> saveLoginState(UserModel? userData) async {
    final box = Hive.box<UserHiveModel>('userBox');
    print('user save sucess  withe id ${userData?.id}');
    final user = UserHiveModel(
      type: userData?.type ?? '0',
      email: userData?.email ?? '',
      whatsAppNumber: userData?.whatsAppNumber,
      nickName: userData?.nickName ?? 'Ghost',
      name: userData?.name ?? '',
      phoneNumber: userData?.phoneNumber ?? '0',
      token: userData?.token ?? generateToken(),
      id: userData?.id ?? 0,
      image: userData?.image ?? "",
      lastUpdatePhone: userData?.lastUpdatePhone,
      availableProducts: userData?.availableProducts,
      workDays: userData?.workDays,
      endTime: userData?.endTime,
      latitude: userData?.latitude,
      location: userData?.location,
      description: userData?.description,
      longitude: userData?.longitude,
      mowaterDiscount: userData?.mowaterDiscount,
      specialtyCategorys: userData?.specialtyCategorys,
      startTime: userData?.startTime,
      subscriptionState: userData?.subscriptionState,
      carMakes: userData?.carMakes,
      lastUpdateWhatsAppNumber: userData?.lastUpdateWhatsAppNumber,
      emailState: userData?.emailState ?? 0,
    );
    await box.put('user', user);
  }

  static Future<void> logout() async {
    final box = Hive.box<UserHiveModel>('userBox');
    box.delete('user');
    box.clear();
    print(box.values.map((element) => element.email));
  }

  static bool checkToken() {
    final box = Hive.box<UserHiveModel>('userBox');
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

  static UserHiveModel getUserInformation() {
    final box = Hive.box<UserHiveModel>('userBox');
    if (box.isNotEmpty) {
      final boxUser = box.get('user');
      print(boxUser?.id);
      if (boxUser != null) {
        return boxUser;
      }
    }
    return UserHiveModel(
      email: '',
      nickName: '',
      name: 'Ghost',
      phoneNumber: '0',
      token: generateToken(),
      id: -1,
      image: '',
      whatsAppNumber: '',
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
    final box = Hive.box<UserModel>('userBox');
    final user = UserModel(
      type: '0',
      email: email,
      nickName: nickName,
      image: image,
      name: username,
      phoneNumber: phoneNumber,
      token: token,
      id: id,
      whatsAppNumber: whatsappNumber,
      lastUpdatePhone: lastUpdatePhoneNumber,
      lastUpdateWhatsAppNumber: lastUpdateWhatsAppNumber,
      emailState: emailState,
    );
    await box.put('user', user);
  }

  static Future<void> updateUserInfo(UserHiveModel updatedUser) async {
    final box = Hive.box<UserHiveModel>('userBox');
    if (box.isNotEmpty) {
      final user = box.get('user');
      if (user != null) {
        user.type = updatedUser.type ?? user.type;
        user.email = updatedUser.email ?? user.email;
        user.whatsAppNumber = updatedUser.whatsAppNumber ?? user.whatsAppNumber;
        user.nickName = updatedUser.nickName ?? user.nickName;
        user.name = updatedUser.name ?? user.name;
        user.phoneNumber = updatedUser.phoneNumber ?? user.phoneNumber;
        user.token = updatedUser.token ?? user.token;
        user.image = updatedUser.image ?? user.image;
        user.lastUpdatePhone =
            updatedUser.lastUpdatePhone ?? user.lastUpdatePhone;
        user.availableProducts =
            updatedUser.availableProducts ?? user.availableProducts;
        user.workDays = updatedUser.workDays ?? user.workDays;
        user.endTime = updatedUser.endTime ?? user.endTime;
        user.latitude = updatedUser.latitude ?? user.latitude;
        user.location = updatedUser.location ?? user.location;
        user.description = updatedUser.description ?? user.description;
        user.longitude = updatedUser.longitude ?? user.longitude;
        user.mowaterDiscount =
            updatedUser.mowaterDiscount ?? user.mowaterDiscount;
        user.specialtyCategorys =
            updatedUser.specialtyCategorys ?? user.specialtyCategorys;
        user.startTime = updatedUser.startTime ?? user.startTime;
        user.subscriptionState =
            updatedUser.subscriptionState ?? user.subscriptionState;
        user.carMakes = updatedUser.carMakes ?? user.carMakes;
        user.lastUpdateWhatsAppNumber = updatedUser.lastUpdateWhatsAppNumber ??
            user.lastUpdateWhatsAppNumber;
        user.emailState = updatedUser.emailState ?? user.emailState;

        await box.put('user', user);
      }
    }
  }
}
