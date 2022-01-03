import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/constants/notification_type.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/favorite.dart';
import 'package:game_sale/providers/favorites_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// お気に入り用の通知ボタンを作成
class NotificationButton extends HookConsumerWidget {
  const NotificationButton({
    Key? key,
    required this.favorite,
  }) : super(key: key);

  /// お気に入り情報
  final Favorite favorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationType = useState(favorite.notificationType);
    final notification = NotificationType.values
        .firstWhere((element) => element.key == notificationType.value);

    return OutlinedButton.icon(
      onPressed: () async {
        await showModalBottomSheet<int>(
          context: context,
          builder: (BuildContext context) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: NotificationType.values.length + 1,
              itemBuilder: (_, index) {
                if (index < NotificationType.values.length) {
                  return RadioListTile<NotificationType>(
                    value: NotificationType.values.elementAt(index),
                    groupValue: notification,
                    onChanged: (NotificationType? newNotification) async {
                      notificationType.value = newNotification!.key;
                      await ref
                          .read(favoritesProvider.notifier)
                          .updateNotification(favorite.id, newNotification.key);
                      Navigator.of(context).pop();
                    },
                    title: Text(NotificationType.values[index].title),
                  );
                } else {
                  return SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          S.of(context).cancel,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      label: Text(
        notification.title,
        style: TextStyle(
            fontSize: 13.0,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black54
                : Colors.white60),
      ),
      icon: notification == NotificationType.off
          ? Icon(
              Icons.notifications_active_outlined,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black54
                  : Colors.white60,
              size: 16.0,
            )
          : Icon(
              Icons.notifications_active,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black54
                  : Colors.white60,
              size: 16.0,
            ),
    );
  }
}
