import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String contentText;
  final int overviewMaxLines;
  final List<ExtraInfo> extraDetailsItems;

  const InfoCard({
    super.key,
    required this.title,
    required this.contentText,
    required this.overviewMaxLines,
    required this.extraDetailsItems,
  });

  Future<void> showInfoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Information'),
        content: SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contentText, style: const TextStyle(fontSize: 16)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Extra Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: extraDetailsItems,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: double.maxFinite,
        child: InkWell(
          onTap: () => showInfoDialog(context),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 12)
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    contentText.isEmpty
                        ? 'No Description Provided'
                        : contentText,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: overviewMaxLines,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExtraInfo extends StatelessWidget {
  final String title;
  final String? info;

  const ExtraInfo({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return info == null || info!.isEmpty
        ? const SizedBox()
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style:  TextStyle(fontWeight: FontWeight.bold, color: colors.primary)),
                Text(info!)
              ],
            ),
        );
  }
}
