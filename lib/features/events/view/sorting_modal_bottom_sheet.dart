part of '../events_screen.dart';

void _showSortingModalBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        void _sortEvents(EventsSorting eventsSorting) {
          Navigator.of(builderContext, rootNavigator: true).pop();
          context.read<EventsBloc>().add(
                SortEventsEvent(
                  eventsSorting,
                ),
              );
        }

        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    S.of(context).eventsListSortingWidgetTitle,
                    style: customTextStyles.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton(
                        onPressed: () =>
                            _sortEvents(EventsSorting.byDateAscending),
                        child: Text(S.of(context).eventsListSortingWidgetSortByDateAscending),
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            _sortEvents(EventsSorting.byDateDescending),
                        child: Text(S.of(context).eventsListSortingWidgetSortByDateDescending),
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            _sortEvents(EventsSorting.byNameAscending),
                        child: Text(S.of(context).eventsListSortingWidgetSortByNameAscending),
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            _sortEvents(EventsSorting.byNameDescending),
                        child: Text(S.of(context).eventsListSortingWidgetSortByNameDescending),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
