import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/layouts/adaptive_layout.dart';
import 'package:sales_management_system/Views/layouts/disktop_layout.dart';
import 'package:sales_management_system/Views/layouts/mobile_layout.dart';
import 'package:sales_management_system/Views/layouts/tablet_layout.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivLayout(
      //======================== هاااام =======================
      //هون عم نأشأ اوبجتات من كلشي بعدين نفحص شو الشاشة وعرضها
      //لهيك انا عم أنشأ اوبجكتات مالي بحاجتها
      //لهيك بحط هون هيك وبحط بالادابتيف بحط انو
      //يستقبل ويدجيت بيلدر(هي عبارة عن ويدجت بس بتقبل كونتكست كباراميتر)
      mobileLayout: (context) => const MobileLayout(),
      tabletLayout: (context) => const TabletLayout(),
      disktopLayout: (context) => const DisktopLayout(),
    );
  }
}
