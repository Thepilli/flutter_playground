import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatefulWidget {
  const SliverAppBarWidget({super.key});

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            // default behavior, hides the title when scroll down, shows it after scroll up
            pinned: false,
            snap: false,
            floating: false,
            // shows the title when scroll down, shows the image even if the first item in the list is not reached.
            // pinned: true,
            // snap: true,
            // floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Goa', textScaleFactor: 1),
              background: Image.asset(
                'assets/pika.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarWidgetAppBar extends StatefulWidget {
  const SliverAppBarWidgetAppBar({super.key});

  @override
  State<SliverAppBarWidgetAppBar> createState() =>
      _SliverAppBarWidgetAppBarState();
}

class _SliverAppBarWidgetAppBarState extends State<SliverAppBarWidgetAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            // default behavior, hides the title when scroll down, shows it after scroll up
            pinned: false,
            snap: false,
            floating: false,
            // shows the title when scroll down, shows the image even if the first item in the list is not reached.
            // pinned: true,
            // snap: true,
            // floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Goa', textScaleFactor: 1),
              background: Image.asset(
                'assets/pika.jpg',
                fit: BoxFit.fill,
              ),
            ),
            bottom: AppBar(
              title: const SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term'),
                ),
              ),
            ),
          ),
          //3
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ItemTile(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 50,
          height: 30,
          color: color.withOpacity(0.5),
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}

class SliverAppBarWidgetTabBar extends StatefulWidget {
  const SliverAppBarWidgetTabBar({super.key});

  @override
  State<SliverAppBarWidgetTabBar> createState() =>
      _SliverAppBarWidgetTabBarState();
}

class _SliverAppBarWidgetTabBarState extends State<SliverAppBarWidgetTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Goa', textScaleFactor: 1),
                  background: Image.asset(
                    'assets/pika.jpg',
                    fit: BoxFit.fill,
                  ),
                  stretchModes: const [StretchMode.zoomBackground],
                ),
                //collapsedHeight: 100,
              ),
              SliverPersistentHeader(
                delegate: MySliverPersistentHeaderDelegate(
                  const TabBar(
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.flight,
                        color: Colors.pink,
                      )),
                      Tab(
                          icon: Icon(Icons.directions_transit,
                              color: Colors.pink)),
                      Tab(icon: Icon(Icons.directions_car, color: Colors.pink)),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class SliverAppBarWidgetListener extends StatefulWidget {
  const SliverAppBarWidgetListener({super.key});

  @override
  State<SliverAppBarWidgetListener> createState() =>
      _SliverAppBarWidgetListenerState();
}

class _SliverAppBarWidgetListenerState
    extends State<SliverAppBarWidgetListener> {
  late ScrollController _scrollController;
  Color _textColor = Colors.blue;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          //2
          SliverAppBar(
            // default behavior, hides the title when scroll down, shows it after scroll up
            // pinned: false,
            // snap: false,
            // floating: false,
            // shows the title when scroll down, shows the image even if the first item in the list is not reached.
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Goa',
                textScaleFactor: 1,
                style: TextStyle(color: _textColor),
              ),
              background: Image.asset(
                'assets/pika.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
