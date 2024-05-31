part of '../events_screen.dart';

class _EventsListWidget extends StatefulWidget {
  final EventsDefaultState state;

  const _EventsListWidget({required this.state, Key? key}) : super(key: key);

  @override
  State<_EventsListWidget> createState() => _EventsListWidgetState();
}

class _EventsListWidgetState extends State<_EventsListWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  // ignore: member-ordering
  void _scrollListener() {
    final isAllEventsDisplayed =
        widget.state.events.length >= widget.state.eventsTotal;

    if (_scrollController.position.extentAfter < 500 && !isAllEventsDisplayed) {
      context.read<EventsBloc>().add(LoadEventsEvent(widget.state.events));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAllEventsDisplayed =
        widget.state.events.length >= widget.state.eventsTotal;

    return Column(
      children: [
        // TODO: implement sorting on the backend and uncomment the line, because at the moment only the received events are sorted, and all should be
        // _SortingSelectionWidget(events: state.events),
        // TODO: do the calculation of the height of the cards at this level and pass the value to the itemExtent in the builder
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) => index == widget.state.events.length && !isAllEventsDisplayed
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: PendingWidget()),
                  )
                : IndentWidget(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: EventCard(
                          event: widget.state.events[index],
                          cardWidth: constraints.maxWidth,
                        ),
                      ),
                    ),
                  ),
            itemCount: isAllEventsDisplayed
                ? widget.state.events.length
                : widget.state.events.length + 1,
          ),
        ),
      ],
    );
  }
}
