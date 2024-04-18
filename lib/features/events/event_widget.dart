import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenue/common/constants.dart';
import 'package:evenue/common/price_formatter.dart';
import 'package:evenue/common/ui/common_ui_provider.dart';
import 'package:evenue/common/ui/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/features/event_details/event_details_widget.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  final double cardWidth;

  const EventWidget({
    required this.event,
    required this.cardWidth,
    Key? key,
  }) : super(key: key);

  void _navigateToDetails(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsWidget(event),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final double paddingAroundContent = 4;
    final double paddingAroundInfo = 6;
    final double contentWidth = cardWidth - (paddingAroundContent * 2);
    final double contentSection = contentWidth / 3;

    final double imageWidth = contentSection;
    final double imageHeight = imageWidth;

    final contentHeight = imageHeight + (paddingAroundContent * 2);

    final int descriptionMaxLines = 3;

    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Container(
        padding: EdgeInsets.all(paddingAroundContent),
        decoration: BoxDecoration(
          color: CustomColorScheme.backgroundColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: commonUiProvider.shadow,
        ),
        width: cardWidth,
        height: contentHeight,
        child: Row(
          children: [
            Container(
              width: contentSection * 2,
              child: Padding(
                padding: EdgeInsets.all(paddingAroundInfo),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: CustomColorScheme.primaryColor,
                        ),
                        SizedBox(width: 4),
                        Text(
                          event.startDate.date,
                          style: customTextStyles.cardDate,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      event.name,
                      style: customTextStyles.cardTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      event.description,
                      style: customTextStyles.cardDescription,
                      maxLines: descriptionMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Text(
                      PriceFormatter.getFormattedPrice(event.price),
                      style: customTextStyles.price,
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius - 1),
              child: CachedNetworkImage(
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
                imageUrl: event.imageUrl,
                errorWidget: (_, __, ___) => Image.asset(
                  noImagePlaceholderPath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
