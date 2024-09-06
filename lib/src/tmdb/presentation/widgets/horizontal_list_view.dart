import 'package:flutter/material.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/custom_slide.dart';

class HorizontalListView extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<GenericSlide> slides;
  final VoidCallback loadNextPage;

  const HorizontalListView({
    super.key,
    required this.title,
    this.subtitle,
    required this.slides,
    required this.loadNextPage,
  });

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 370,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                color: colors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.slides.length,
                itemBuilder: (BuildContext context, int index) =>
                    CustomSlide(slide: widget.slides[index], height: 280)),
          ),
        ],
      ),
    );
  }
}
