import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';
import 'package:go_router/go_router.dart';

class RaitingButton extends ConsumerWidget {
  final AsyncValue<TitleAccountState> asyncAccountState;
  final Future<void> Function(int) castRaitingCallback;
  final VoidCallback deleteRaitingCallback;

  const RaitingButton({
    super.key,
    required this.asyncAccountState,
    required this.castRaitingCallback,
    required this.deleteRaitingCallback,
  });

  Future<void> _showRaitingDialog(BuildContext context) async {
    if (!asyncAccountState.hasValue) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Raiting'),
        content: _CustomSlider(
          initialValue: asyncAccountState.value!.raiting,
          castRaitingCallback: castRaitingCallback,
          deleteRaitingCallback: deleteRaitingCallback,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(shape: const StadiumBorder()),
      onPressed: () {
        _showRaitingDialog(context);
      },
      label: asyncAccountState.when(
        error: (error, stackTrace) => const Text('Rate It'),
        loading: () => const Text('Loading'),
        data: (data) {
          if (data.raiting == null) {
            return const Text('Rate It');
          }

          return const Text('Edit your raiting');
        },
      ),
      icon: asyncAccountState.when(
        error: (error, stackTrace) => const Icon(Icons.star_border),
        loading: () => const SizedBox(
          height: 10,
          width: 10,
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
        ),
        data: (data) {
          if (data.raiting == null) {
            return const Icon(Icons.star_border);
          }

          return const Icon(Icons.star);
        },
      ),
    );
  }
}

class _CustomSlider extends ConsumerStatefulWidget {
  final int? initialValue;
  final Future<void> Function(int) castRaitingCallback;
  final VoidCallback deleteRaitingCallback;

  const _CustomSlider({
    required this.initialValue,
    required this.castRaitingCallback,
    required this.deleteRaitingCallback,
  });

  @override
  ConsumerState<_CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends ConsumerState<_CustomSlider> {
  double currentRaiting = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      setState(() {
        currentRaiting = widget.initialValue!.toDouble();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Slider(
              min: 0,
              max: 10,
              divisions: 9,
              value: currentRaiting,
              label: currentRaiting.round().toString(),
              onChanged: (value) {
                setState(() {
                  currentRaiting = value;
                });
              },
            ),
          ),

          const Spacer(),

          Row(
            children: [
              const Spacer(),

              widget.initialValue == null
                  ? const Spacer()
                  : TextButton(
                      onPressed: () {
                        widget.deleteRaitingCallback();
                        context.pop();
                      },
                      child: const Text(
                        'Clear raiting',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
              FilledButton.icon(
                onPressed: () async {
                  widget.castRaitingCallback(currentRaiting.toInt());
                  context.pop();
                },
                label: const Text('Done'),
                icon: const Icon(Icons.done),
              ),
            ],
          )
        ],
      ),
    );
  }
}
