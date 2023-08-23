// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flavors/general/notifiers/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    DateTime now = DateTime.now();
    String welcomeString = 'Good evening!';
    if (now.hour < 12) {
      welcomeString = 'Good morning!';
    } else if (now.hour < 18) {
      welcomeString = 'Good afternoon!';
    }
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: title ??
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  child: Text(
                    'AM',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$welcomeString 🤘',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w300, fontSize: 18),
                    ),
                    Text(
                      userNotifier.currentUser?.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        70,
      );
}
