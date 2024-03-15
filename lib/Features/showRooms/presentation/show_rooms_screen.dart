import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/showRooms/data/ads/showRooms/show_rooms_cubit.dart';
import 'package:Mowater/Features/showRooms/presentation/widgets/ads.dart';
import 'package:Mowater/Features/showRooms/presentation/widgets/show_room.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class ShowRoomsScreen extends StatelessWidget {
  const ShowRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ShowRooms".tr(),
          style: TextStyles.text_22,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ShowroomsAds(),
            const Divider(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                children: [
                  BlocBuilder<ShowRoomsCubit, ShowRoomsState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox.shrink(),
                        success: (showrooms) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: showrooms.length,
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    context.push(RouteName.showRoomDetails,
                                        extra: showrooms[index]);
                                  },
                                  child: ShowRoomWidget(
                                      showroomModel: showrooms[index])));
                        },
                        loading: () =>
                            const CircularProgressIndicator.adaptive(),
                        faliure: () => Text('Ther Is No Showrooms Yet'.tr()),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
