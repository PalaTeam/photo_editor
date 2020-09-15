import 'package:flutter/material.dart';
import 'package:photo_editor/filter/filter.dart';

class FilterList extends StatelessWidget {
  final List<Filter> filters;
  final ImageProvider image;
  final OnFilterSelected onFilterSelected;
  final double size;
  final EdgeInsets padding;
  final double spacing;
  final ScrollPhysics physics;
  final BorderRadius borderRadius;
  final BoxFit fit;

  const FilterList({
    Key key,
    @required this.image,
    @required this.filters,
    @required this.onFilterSelected,
    this.size = 75.0,
    this.padding = const EdgeInsets.all(10.0),
    this.spacing = 5.0,
    this.physics = const ClampingScrollPhysics(),
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + padding.top + padding.bottom + 25.0,
      child: ListView.separated(
        shrinkWrap: true,
        padding: padding,
        scrollDirection: Axis.horizontal,
        physics: physics,
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemBuilder: (_, index) => FilterItem(
          filter: filters[index],
          image: image,
          onFilterSelected: onFilterSelected,
          size: size,
          spacing: spacing,
          borderRadius: borderRadius,
          fit: fit,
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final Filter filter;
  final ImageProvider image;
  final OnFilterSelected onFilterSelected;
  final double size;
  final double spacing;
  final BorderRadius borderRadius;
  final BoxFit fit;

  const FilterItem({
    Key key,
    @required this.filter,
    @required this.image,
    @required this.onFilterSelected,
    this.size = 75.0,
    this.spacing = 5.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onFilterSelected(filter),
      child: Container(
        width: size,
        child: Column(
          children: [
            ColorFiltered(
              colorFilter: filter.filter,
              child: Container(
                height: size,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image: DecorationImage(
                    fit: fit,
                    image: image,
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing),
            Expanded(
              child: Text(
                filter.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef void OnFilterSelected(Filter filter);
