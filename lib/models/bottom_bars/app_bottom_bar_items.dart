import 'package:flutter_svg/svg.dart';
import 'package:splyshechka/utils/app_icons.dart';

enum AppBottomBarItem { bedtime, localMall, autoGraph }

extension AppBottomBarExtension on AppBottomBarItem {
  SvgPicture get iconEnabled {
    switch (this) {
      case AppBottomBarItem.bedtime:
        return SvgPicture.asset(AppIcons.bedtimeEnabled);
      case AppBottomBarItem.localMall:
        return SvgPicture.asset(AppIcons.articleEnabled);
      case AppBottomBarItem.autoGraph:
        return SvgPicture.asset(AppIcons.autoGraphEnabled);
    }
  }

  SvgPicture get iconDisabled {
    switch (this) {
      case AppBottomBarItem.bedtime:
        return SvgPicture.asset(AppIcons.bedtimeDisabled);
      case AppBottomBarItem.localMall:
        return SvgPicture.asset(AppIcons.articleDisabled);
      case AppBottomBarItem.autoGraph:
        return SvgPicture.asset(AppIcons.autoGraphDisabled);
    }
  }
}
