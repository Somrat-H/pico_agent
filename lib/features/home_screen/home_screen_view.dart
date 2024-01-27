import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_route.dart';
import '../../common/colors.dart';
import '../landing/application/model.dart';
part 'widgets/widgets.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.98,
          ),
          itemCount: ourServices.length,
          itemBuilder: (context, index) => _CustomBox(
                servieceName: ourServices[index].servieceName,
                serviecLogo: ourServices[index].servieceLogo,
                onTap: () {
                  if (index == 0) {
                    context.go(AppRoute.appoinments);
                  } else if (index == 1) {
                    context.go(AppRoute.cancledAppoinments);
                  } else if (index == 2) {
                    context.go(AppRoute.listDoctor);
                  } else if (index == 3) {
                    context.go(AppRoute.listPathology);
                  } else if (index == 4) {
                    context.go(AppRoute.addDoctor);
                  } else if (index == 5) {
                    context.go(AppRoute.addPathology);
                  } else if (index == 6) {
                    context.go(AppRoute.reportUpload);
                  } else if (index == 7) {
                    context.go(AppRoute.prescriptionUpload);
                  }
                },
              )),
    );
  }
}
