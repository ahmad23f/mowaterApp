import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
import 'package:mowaterApp/Features/Trending/presntation/trending_screen.dart';
import 'package:mowaterApp/Features/drawer/drawer.dart';
import 'package:mowaterApp/Features/favorite/presentation/favorite_screen.dart';
import 'package:mowaterApp/Features/fuel/presentation/fuelPrice/fuel_price_cubit.dart';
import 'package:mowaterApp/Features/fuel/presentation/fuel_screen.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/home_body.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/di/dependency_injection.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  late final List<Widget> _pages;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeBody(),
      const TrendingScreen(),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<FuelPriceCubit>()..getPrice(),
          ),
          BlocProvider(
            create: (context) => getIt<CarModelsBrandsCubit>(),
          ),
        ],
        child: const FuelScreen(),
      ),
      const FavoriteScreen(),
    ];
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerSlide(),
      floatingActionButton: currentPage == 0
          ? Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: ColorApp.primeryColorDark,
                  padding: const EdgeInsets.all(2), // Adjust padding as needed
                  elevation: 8, // Add elevation to create shadow
                ),
                onPressed: () {
                  // Add onPressed action
                  context.push(RouteName.service24);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/call_24.png',
                    height: 50, // Adjust the height of the image
                    width: 50, // Adjust the width of the image
                  ),
                ),
              ),
            )
          : null,
      appBar: AppBar(
        title: ListTile(
          subtitle: Text(
            "Welcome to mowaterApp",
            style: TextStyles.text_14.copyWith(fontSize: 14.sp),
          ),
          title: UserServices.checkToken()
              ? Text(
                  Hive.box<User>('userBox').values.first.nickName ?? '',
                  style: TextStyles.text_18
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )
              : Text(
                  'user',
                  style: TextStyles.text_18
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        backgroundColor: ColorApp.primeryColorDark,
        color: ColorApp.secunderyColorDark,
        index: _pageController.initialPage,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.local_offer_outlined, size: 30),
          Icon(Icons.local_gas_station_rounded, size: 30),
          Icon(Icons.favorite_border, size: 30),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.linear,
              duration: const Duration(milliseconds: 300));
          currentPage = index;
          setState(() {});
        },
      ),
    );
  }
}
