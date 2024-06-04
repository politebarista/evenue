part of 'event_card.dart';

// In the EventCard "content" refers to the size of the card without inner padding
final class EventCardSizes {
  final double cardWidth, cardHeight;
  final double contentWidth, contentSectionWidth;
  final double imageWidth, imageHeight;
  final double infoAreaWidth;

  static const double _paddingAroundContent = 4, _paddingAroundInfo = 6;
  static const int _contentSectionsTotal = 3, _descriptionMaxLines = 2;

  double get paddingAroundContent => _paddingAroundContent;
  double get paddingAroundInfo => _paddingAroundInfo;
  int get descriptionMaxLines => _descriptionMaxLines;

  EventCardSizes({
    required this.cardWidth,
    required this.cardHeight,
    required this.contentWidth,
    required this.contentSectionWidth,
    required this.imageWidth,
    required this.imageHeight,
    required this.infoAreaWidth,
  });

  factory EventCardSizes.fromCardWidth(final double cardWidth) {
    final double contentWidth = cardWidth - (_paddingAroundContent * 2);
    final double contentSectionWidth = contentWidth / _contentSectionsTotal;

    final double imageWidth = contentSectionWidth;
    final double imageHeight = imageWidth;

    final double infoAreaWidth = contentSectionWidth * 2;

    final cardHeight = imageHeight + (_paddingAroundContent * 2);

    return EventCardSizes(
      cardWidth: cardWidth,
      cardHeight: cardHeight,
      contentWidth: contentWidth,
      contentSectionWidth: contentSectionWidth,
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      infoAreaWidth: infoAreaWidth,
    );
  }
}
