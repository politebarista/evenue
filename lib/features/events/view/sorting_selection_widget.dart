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
                    EventsSorting.byDateAscending,
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
                    EventsSorting.byDateDescending,
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
                    EventsSorting.byNameAscending,
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
                    EventsSorting.byNameDescending,
                  ),
                ),
                child: Text('sort by name desc'),
              ),
            ),
          ],
        ),
      );
  }
}
