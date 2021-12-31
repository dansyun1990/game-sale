import 'package:game_sale/generated/l10n.dart';

enum NotificationType { off, fluctuation, lowest }

extension NotificationTypeExtension on NotificationType {
  int get key {
    switch (this) {
      case NotificationType.off:
        return 0;
      case NotificationType.fluctuation:
        return 1;
      case NotificationType.lowest:
        return 2;
    }
  }

  String get title {
    switch (this) {
      case NotificationType.off:
        return S.current.notificationOff;
      case NotificationType.fluctuation:
        return S.current.priceFluctuation;
      case NotificationType.lowest:
        return S.current.lowestPrice;
    }
  }
}
