import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenue/common/ui/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_paddings.dart';
import 'package:evenue/models/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  final double cardWidth;

  const EventWidget({
    required this.event,
    this.cardWidth = double.infinity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 200;

    final double paddingAroundContent = 4;

    final double imageHeight = (cardHeight - (2 * paddingAroundContent)) / 2;
    final double imageWidth = (cardWidth - (2 * paddingAroundContent));

    final int descriptionMaxLines = 4;

    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: Container(
        padding: EdgeInsets.all(paddingAroundContent),
        color: CustomColorScheme.primaryColor,
        width: cardWidth,
        height: cardHeight,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              child: Image(
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  event.imageUrl,
                ),
              ),
            ),
            CustomPaddings.v4,
            Text(event.name),
            CustomPaddings.v4,
            Text(
              event.description,
              maxLines: descriptionMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
