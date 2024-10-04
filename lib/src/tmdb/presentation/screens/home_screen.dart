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

    return Scaffold(
      body: destinations[index].child,
      drawer: SafeArea(
        child: NavigationDrawer(
            selectedIndex: index,
            onDestinationSelected: (value) {
              ref.read(homeIndexProvider.notifier).changeIndex(value);
            },
            children: [
              const _CustomDrawerHeader(),
              
              ...List.generate(
                3,
                (index) {
                  final icon = Icon(destinations[index].iconData);
                  final name = Text(destinations[index].name);
        
                  return NavigationDrawerDestination(icon: icon, label: name);
                },
              ),
              
              const Divider(),
              
              NavigationDrawerDestination(
                icon: Icon(destinations[3].iconData),
                label: Text(destinations[3].name),
              ),
              NavigationDrawerDestination(
                icon: Icon(destinations[4].iconData),
                label: Text(destinations[4].name),
              ),
        
              const Divider(),
        
              NavigationDrawerDestination(
                icon: Icon(destinations[5].iconData),
                label: Text(destinations[5].name),
              ),
              NavigationDrawerDestination(
                icon: Icon(destinations[6].iconData),
                label: Text(destinations[6].name),
              ),
        
              const Divider(),
        
              NavigationDrawerDestination(
                icon: Icon(destinations[7].iconData),
                label: Text(destinations[7].name),
              ),
              NavigationDrawerDestination(
                icon: Icon(destinations[8].iconData),
                label: Text(destinations[8].name),
              ),
            ]),
      ),
    );
  }
}

class _CustomDrawerHeader extends ConsumerWidget {
  const _CustomDrawerHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).primaryColor;
    final loggedUser = ref.watch(loggedUserProvider);

    return DrawerHeader(
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5)
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        children: [
          CircleAvatar(
            minRadius: 30,
            backgroundImage: loggedUser.when(
              error: (error, stackTrace) => null,
              loading: () => null,
              data: (data) => NetworkImage(
                  'https://image.tmdb.org/t/p/w500${data!.avatarPath}'),
            ),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              loggedUser.when(
                error: (error, stackTrace) => const Text('Unknown'),
                loading: () => const Text('Loading name'),
                data: (data) => Text(
                  data!.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              FilledButton.icon(
                style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(
                    Size(120, 20)
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                onPressed: () {
                  ref.read(authenticationProvider.notifier).logout();
                },
                icon: const Icon(Icons.logout, size: 20),
                label: const Text('Log Out'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
