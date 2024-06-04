part of '../events_screen.dart';

const _eventCardVerticalPadding = 4.0;

class _EventsListWidget extends StatefulWidget {
  final EventsDefaultState state;

  const _EventsListWidget({required this.state, Key? key}) : super(key: key);

  @override
  State<_EventsListWidget> createState() => _EventsListWidgetState();
}

class _EventsListWidgetState extends State<_EventsListWidget> {
  late final ScrollController _scrollController;

  EventCardSizes? _eventCardSizes;
  double? _eventCardHeightWithPadding;

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
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (_eventCardSizes == null) {
                _eventCardSizes = EventCardSizes.fromCardWidth(
                  constraints.maxWidth - (IndentWidget.indent * 2),
                );
              }
              if (_eventCardHeightWithPadding == null) {
                _eventCardHeightWithPadding =
                    _eventCardSizes!.cardHeight + _eventCardVerticalPadding * 2;
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<EventsBloc>().add(RefreshEventsEvent());
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemExtent: _eventCardHeightWithPadding!,
                  itemBuilder: (context, index) =>
                    index == widget.state.events.length && !isAllEventsDisplayed
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: PendingWidget()),
                        )
                      : IndentWidget(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: _eventCardVerticalPadding,
                            ),
                            child: EventCard(
                              event: widget.state.events[index],
                              cardSizes: _eventCardSizes!,
                            ),
                          ),
                        ),
                  itemCount: isAllEventsDisplayed
                      ? widget.state.events.length
                      : widget.state.events.length + 1,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
