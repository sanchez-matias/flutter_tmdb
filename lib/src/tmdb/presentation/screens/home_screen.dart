import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/config/router.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/views/views.dart';

class MenuDestination {
  final String name;
  final IconData iconData;
  final Widget child;

  MenuDestination({
    required this.name,
    required this.iconData,
    required this.child,
  });
}

final destinations = [
  MenuDestination(
    name: 'Movies',
    iconData: Icons.movie,
    child: const MoviesView(),
  ),
  MenuDestination(
    name: 'TV',
    iconData: Icons.tv,
    child: const TvView(),
  ),
  MenuDestination(
    name: 'Popular People',
    iconData: Icons.people,
    child: const ActorsView(),
  ),
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeIndexProvider);

    return Scaffold(
      body: destinations[index].child,
      drawer: NavigationDrawer(
          selectedIndex: index,
          onDestinationSelected: (value) {
            ref.read(homeIndexProvider.notifier).changeIndex(value);
          },
          children: [
            const DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [
                  CircleAvatar(minRadius: 30),
                  SizedBox(width: 20),
                  Text('Username')
                ],
              ),
            ),
            ...List.generate(
              destinations.length,
              (index) {
                final name = Text(destinations[index].name);
                final icon = Icon(destinations[index].iconData);

                return NavigationDrawerDestination(icon: icon, label: name);
              },
            ),

            const Divider()
          ]),
    );
  }
}
