import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenue/common/constants.dart';
import 'package:evenue/common/price_formatter.dart';
import 'package:evenue/common/ui/common_ui_provider.dart';
import 'package:evenue/common/ui/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/features/event_details/event_details_screen.dart';
import 'package:evenue/models/event.dart';
import 'package:flutter/material.dart';

part 'event_card_sizes.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final EventCardSizes cardSizes;

  const EventCard({
    required this.event,
    required this.cardSizes,
    Key? key,
  }) : super(key: key);

  void _navigateToDetails(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsScreen(event),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Container(
        padding: EdgeInsets.all(cardSizes.paddingAroundContent),
        decoration: BoxDecoration(
          color: CustomColorScheme.backgroundColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: commonUiProvider.shadow,
        ),
        width: cardSizes.cardWidth,
        height: cardSizes.cardHeight,
        child: Row(
          children: [
            Container(
              width: cardSizes.infoAreaWidth,
              child: Padding(
                padding: EdgeInsets.all(cardSizes.paddingAroundInfo),
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
                      maxLines: cardSizes.descriptionMaxLines,
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
                width: cardSizes.imageWidth,
                height: cardSizes.imageHeight,
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
