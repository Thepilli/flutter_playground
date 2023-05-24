import 'package:flutter/material.dart';

class TabBarDeepdiveWidget extends StatefulWidget {
  const TabBarDeepdiveWidget({super.key});

  @override
  State<TabBarDeepdiveWidget> createState() => _TabBarDeepdiveWidgetState();
}

class _TabBarDeepdiveWidgetState extends State<TabBarDeepdiveWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 10, //
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.greenAccent,
              image: const DecorationImage(
                  image: AssetImage('assets/pika.jpg'), fit: BoxFit.fitWidth),
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.flight),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
              ),
            ],
          ),
          title: const Text('Static Tabs'),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}

class TabBarDeepdiveWidgetScrollable extends StatefulWidget {
  const TabBarDeepdiveWidgetScrollable({super.key});

  @override
  State<TabBarDeepdiveWidgetScrollable> createState() =>
      _TabBarDeepdiveWidgetScrollableState();
}

class _TabBarDeepdiveWidgetScrollableState
    extends State<TabBarDeepdiveWidgetScrollable> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,

            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 10, //
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.greenAccent,
              image: const DecorationImage(
                  image: AssetImage('assets/pika.jpg'), fit: BoxFit.fitWidth),
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.flight),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.flight),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.flight),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.flight),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
              ),
            ],
          ),
          title: const Text('Scrollable Tabs'),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}

class TabBarDeepdiveWidgetNested extends StatefulWidget {
  const TabBarDeepdiveWidgetNested({super.key});

  @override
  State<TabBarDeepdiveWidgetNested> createState() =>
      _TabBarDeepdiveWidgetNestedState();
}

class _TabBarDeepdiveWidgetNestedState
    extends State<TabBarDeepdiveWidgetNested> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                title: Text('Nested (Sliver) Tabs'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  // isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text('Flight'),
                    ),
                    Tab(
                      child: Text('Train'),
                    ),
                    Tab(
                      child: Text('Car'),
                    ),
                    Tab(
                      child: Text('Cycle'),
                    ),
                    Tab(
                      child: Text('Boat'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: <Widget>[
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
              Icon(Icons.directions_bike, size: 350),
              Icon(Icons.directions_boat, size: 350),
            ],
          ),
        ),
      ),
    );
  }
}

// You won’t get a callback when you swipe the tab bar with your finger.
// That’s why it’s always better to add a listener to get notified
class TabBarDeepdiveWidgetListener extends StatefulWidget {
  const TabBarDeepdiveWidgetListener({super.key});

  @override
  State<TabBarDeepdiveWidgetListener> createState() =>
      _TabBarDeepdiveWidgetListenerState();
}

class _TabBarDeepdiveWidgetListenerState
    extends State<TabBarDeepdiveWidgetListener> with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: ${_controller.index}");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Nested (Sliver) Tabs with Listener'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  controller: _controller,

                  // isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Text('Flight'),
                    ),
                    Tab(
                      child: Text('Train'),
                    ),
                    Tab(
                      child: Text('Car'),
                    ),
                    Tab(
                      child: Text('Cycle'),
                    ),
                    Tab(
                      child: Text('Boat'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: const <Widget>[
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
              Icon(Icons.directions_bike, size: 350),
              Icon(Icons.directions_boat, size: 350),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_selectedIndex == 4) {
              _selectedIndex = -1;
            }
            _controller.animateTo(_selectedIndex += 1);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TabBarDeepdiveWidgetController extends StatefulWidget {
  const TabBarDeepdiveWidgetController({super.key});

  @override
  State<TabBarDeepdiveWidgetController> createState() =>
      _TabBarDeepdiveWidgetControllerState();
}

class _TabBarDeepdiveWidgetControllerState
    extends State<TabBarDeepdiveWidgetController>
    with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text(
                    'Nested (Sliver) Tabs with controller (floating)'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  controller: _controller,

                  // isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Text('Flight'),
                    ),
                    Tab(
                      child: Text('Train'),
                    ),
                    Tab(
                      child: Text('Car'),
                    ),
                    Tab(
                      child: Text('Cycle'),
                    ),
                    Tab(
                      child: Text('Boat'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: const <Widget>[
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
              Icon(Icons.directions_bike, size: 350),
              Icon(Icons.directions_boat, size: 350),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_selectedIndex == 4) {
              _selectedIndex = -1;
            }
            _controller.animateTo(_selectedIndex += 1);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TabBarDeepdiveWidgetNoAppBar extends StatefulWidget {
  const TabBarDeepdiveWidgetNoAppBar({super.key});

  @override
  State<TabBarDeepdiveWidgetNoAppBar> createState() =>
      _TabBarDeepdiveWidgetNoAppBarState();
}

class _TabBarDeepdiveWidgetNoAppBarState
    extends State<TabBarDeepdiveWidgetNoAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    child: Text('Flight'),
                  ),
                  Tab(
                    child: Text('Train'),
                  ),
                  Tab(
                    child: Text('Car'),
                  ),
                  Tab(
                    child: Text('Cycle'),
                  ),
                  Tab(
                    child: Text('Boat'),
                  ),
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_bike, size: 350),
            Icon(Icons.directions_boat, size: 350),
          ],
        ),
      ),
    );
  }
}

class TabBarDeepdiveWidgetWithState extends StatefulWidget {
  const TabBarDeepdiveWidgetWithState({super.key});

  @override
  State<TabBarDeepdiveWidgetWithState> createState() =>
      _TabBarDeepdiveWidgetWithStateState();
}

class _TabBarDeepdiveWidgetWithStateState
    extends State<TabBarDeepdiveWidgetWithState>
    with AutomaticKeepAliveClientMixin<TabBarDeepdiveWidgetWithState> {
  int counter = 0;

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    child: Text('Flight'),
                  ),
                  Tab(
                    child: Text('Train'),
                  ),
                  Tab(
                    child: Text('Car'),
                  ),
                  Tab(
                    child: Text('Cycle'),
                  ),
                  Tab(
                    child: Text('Boat'),
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Text(counter.toString()),
            const Icon(Icons.directions_transit, size: 350),
            const Icon(Icons.directions_car, size: 350),
            const Icon(Icons.directions_bike, size: 350),
            const Icon(Icons.directions_boat, size: 350),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TabBarDeepdiveWidgetWithoutState extends StatefulWidget {
  const TabBarDeepdiveWidgetWithoutState({super.key});

  @override
  State<TabBarDeepdiveWidgetWithoutState> createState() =>
      _TabBarDeepdiveWidgetWithoutStateState();
}

class _TabBarDeepdiveWidgetWithoutStateState
    extends State<TabBarDeepdiveWidgetWithoutState> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    child: Text('Flight'),
                  ),
                  Tab(
                    child: Text('Train'),
                  ),
                  Tab(
                    child: Text('Car'),
                  ),
                  Tab(
                    child: Text('Cycle'),
                  ),
                  Tab(
                    child: Text('Boat'),
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Text(counter.toString()),
            const Icon(Icons.directions_transit, size: 350),
            const Icon(Icons.directions_car, size: 350),
            const Icon(Icons.directions_bike, size: 350),
            const Icon(Icons.directions_boat, size: 350),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
