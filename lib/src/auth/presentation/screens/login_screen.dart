import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_tmdb/src/auth/presentation/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    final authState = ref.watch(authenticationProvider);
    final height = MediaQuery.sizeOf(context).height;

    ref.listen(authenticationProvider, (previous, next) {
      if ( next.message.isEmpty ) return;
      showSnackbar( context, next.message );
    });

    return Scaffold(
      body: Stack(
        children: [
          const _CustomLoginBackround(),
          Center(
            child: Container(
              height: height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Username',
                    onChanged: (value) {
                      usernameController.text = value;
                    },
                  ),
                  CustomTextField(
                    label: 'Password',
                    onChanged: (value) {
                      passwordController.text = value;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                    onPressed: authState.isPosting
                        ? null
                        : () {
                            ref.read(authenticationProvider.notifier).loginUser(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                );
                          },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      child: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login),
                            SizedBox(width: 10),
                            Text('Log In', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: authState.isPosting
                        ? null
                        : () {
                            ref
                                .read(authenticationProvider.notifier)
                                .loginAsGuest();
                          },
                    child: const Text('Log in as Guest'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomLoginBackround extends StatelessWidget {
  const _CustomLoginBackround();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;


    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            colors.primary,
            colors.secondary
          ],
        )),
      ),
    );
  }
}
