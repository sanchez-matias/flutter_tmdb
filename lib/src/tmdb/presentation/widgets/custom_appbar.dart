import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  final String title;
  final Icon? icon;

  const CustomAppbar({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      floating: true,
      centerTitle: true,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
      title: Text(title),
    );
  }
}
