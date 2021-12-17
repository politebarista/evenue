import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenue/common/event_date_helper.dart';
import 'package:evenue/common/price_formatter.dart';
import 'package:evenue/common/ui/common_ui_provider.dart';
import 'package:evenue/common/ui/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/models/event.dart';
import 'package:flutter/material.dart';

class EventDetailsWidget extends StatelessWidget {
  final Event event;

  const EventDetailsWidget(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Icon(
            Icons.star_outline_rounded,
            color: CustomColorScheme.primaryColor,
            size: 30,
          ),
          commonUiProvider.paddings.h12,
        ],
      ),
      body: IndentWidget(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name,
                style: customTextStyles.title,
              ),
              commonUiProvider.paddings.v8,
              ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius - 1),
                child: Image(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    event.imageUrl,
                  ),
                ),
              ),
              commonUiProvider.paddings.v8,
              commonUiProvider.divider,
              commonUiProvider.paddings.v8,
              Text(
                event.description,
                style: customTextStyles.description,
              ),
              commonUiProvider.paddings.v16,
              Row(
                children: [
                  Icon(
                    Icons.event,
                    color: CustomColorScheme.primaryColor,
                  ),
                  commonUiProvider.paddings.h8,
                  Text(
                    EventDateHelper.getDurationBetween(
                      event.startDate,
                      event.endDate,
                    ),
                    style: customTextStyles.description.copyWith(
                      color: CustomColorScheme.primaryColor,
                    ),
                  ),
                ],
              ),
              commonUiProvider.paddings.v8,
              Row(
                children: [
                  Icon(
                    Icons.paid_outlined,
                    color: CustomColorScheme.primaryColor,
                  ),
                  commonUiProvider.paddings.h8,
                  Text(
                    PriceFormatter.getFormattedPrice(event.price),
                    style: customTextStyles.description.copyWith(
                      color: CustomColorScheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
