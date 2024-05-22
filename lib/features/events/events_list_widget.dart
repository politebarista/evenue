part of 'events_screen.dart';

class _EventsListWidget extends StatelessWidget {
  final EventsDefaultState state;

  const _EventsListWidget({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: I think we should replace it with a drop-down list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                color: Colors.pink,
                child: MaterialButton(
                  onPressed: () => context.read<EventsBloc>().add(
                        SortEventsEvent(
                          state.events,
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
                          state.events,
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
                          state.events,
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
                          state.events,
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
                          state.events,
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
                          state.events,
                          EventSortingByPrice(isAscending: false),
                        ),
                      ),
                  child: Text('sort by price desc'),
                ),
              ),
            ],
          ),
        ),
        // TODO: do the calculation of the height of the cards at this level and pass the value to the itemExtent in the builder
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => IndentWidget(
              child: LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: EventCard(
                    event: state.events[index],
                    cardWidth: constraints.maxWidth,
                  ),
                ),
              ),
            ),
            itemCount: state.events.length,
          ),
        ),
      ],
    );
  }
}
