import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/config/router.dart';
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeIndexProvider);
    final destinations = ref.watch(drawerDestinationsProvider);
    final loggedUser = ref.watch(loggedUserProvider);

    return Scaffold(
      body: destinations[index].child,
      drawer: NavigationDrawer(
          selectedIndex: index,
          onDestinationSelected: (value) {
            ref.read(homeIndexProvider.notifier).changeIndex(value);
          },
          children: [
            DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 30,
                    backgroundImage: loggedUser.when(
                      error: (error, stackTrace) => null,
                      loading: () => null,
                      data: (data) => NetworkImage('https://image.tmdb.org/t/p/w500${data!.avatarPath}'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  loggedUser.when(
                    error: (error, stackTrace) => const Text('Unknown'),
                    loading: () => const Text('Loading name'),
                    data: (data) => Text(data!.name),
                  ),
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
            const Divider(),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                ref.read(authenticationProvider.notifier).logout();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text('Log Out', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ]),
    );
  }
}
