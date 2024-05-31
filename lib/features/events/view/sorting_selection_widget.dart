part of '../events_screen.dart';

class _SortingSelectionWidget extends StatelessWidget {
  final List<Event> events;
  
  const _SortingSelectionWidget({required this.events});

  // TODO: I think we should replace it with a drop-down list
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              color: Colors.pink,
              child: MaterialButton(
                onPressed: () => context.read<EventsBloc>().add(
                  SortEventsEvent(
                    events,
                    EventSortingByDate(),
                  ),
                ),
                child: Text('sort by date asc'),
              ),
            ),
            Container(
              color: Colors.green,
              child: MaterialButton(
                onPressed: () => context.read<EventsBloc>().add(
                  SortEventsEvent(
                    events,
                    EventSortingByDate(isAscending: false),
                  ),
                ),
                child: Text('sort by date desc'),
              ),
            ),
            Container(
              color: Colors.yellow,
              child: MaterialButton(
                onPressed: () => context.read<EventsBloc>().add(
                  SortEventsEvent(
                    events,
                    EventSortingByName(),
                  ),
                ),
                child: Text('sort by name asc'),
              ),
            ),
            Container(
              color: Colors.blue,
              child: MaterialButton(
                onPressed: () => context.read<EventsBloc>().add(
                  SortEventsEvent(
                    events,
                    EventSortingByName(isAscending: false),
                  ),
                ),
                child: Text('sort by name desc'),
              ),
            ),
            Container(
              color: Colors.orange,
              child: MaterialButton(
                onPressed: () => context.read<EventsBloc>().add(
                  SortEventsEvent(
                    events,
                    EventSortingByPrice(),
                  ),
                ),
                child: Text('sort by price asc'),
              ),
            ),
            Container(
              color: Colors.tealAccent,
              child: MaterialButton(
                onPressed: () => context.read<EventsBloc>().add(
                  SortEventsEvent(
                    events,
                    EventSortingByPrice(isAscending: false),
                  ),
                ),
                child: Text('sort by price desc'),
              ),
            ),
          ],
        ),
      );
  }
}
