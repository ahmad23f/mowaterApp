import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/Parking/data/model/parking_model.dart';
import 'package:Mowater/Features/Parking/dubaiParking/presentation/dubai_parking_screen.dart';
import 'package:Mowater/Features/Parking/khorfakkan/presntation/khorfakkan_parking_screen.dart';
import 'package:Mowater/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:Mowater/Features/Parking/aboDhabiParking/presentation/abo_dhabi_screen.dart';
import 'package:Mowater/Features/Parking/ajman/presentation/ajman_parking_screen.dart';
import 'package:Mowater/Features/Parking/sharjah/presntation/sharjah_parking_screen.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/di/dependency_injection.dart';
import 'package:Mowater/core/style/text_style.dart';

class ParkingFormScreen extends StatelessWidget {
  final ParkingModel parkingModel;

  const ParkingFormScreen({Key? key, required this.parkingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${parkingModel.name} Parking",
          style: TextStyles.text_22,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<ParkingAdsCubit>()..getParkingAdsIn(parkingModel.id),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              _buildEmirateSpecificWidget(parkingModel.name, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmirateSpecificWidget(String emirateName, context) {
    print(emirateName);
    switch (emirateName) {
      case "Dubai":
        return const DubaiParkingScreen();
      case "Abu Dhabi":
        return const AboDhabiScreen();
      case "Sharjah":
        return const SharjahParkingScreen();
      case "Ajman":
        return const AjmanParkingScreen();
      case "Umm Al-Quwain":
        return const Center(child: Text('soon..Quwain..'));
      case "Ras Al Khaimah":
        return const Text('soon..Khaimah..');
      case "Fujairah":
        return const Text('soon...Fujairah.');
      case "Khorfakkan":
        return const KhorfakkanParkingScreen();
      default:
        return const Center(child: Text('soon.... page'));
    }
  }
}
