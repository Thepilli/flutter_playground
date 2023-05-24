import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
        ],
      ),
    );
  }
}

class GridViewWidgetPhysics extends StatefulWidget {
  const GridViewWidgetPhysics({super.key});

  @override
  State<GridViewWidgetPhysics> createState() => _GridViewWidgetPhysicsState();
}

//When shrinkWrap is false, we need to wrap the GridView inside the
//Expanded widget so that it takes all available space.
//Otherwise, it will throw an error.
class _GridViewWidgetPhysicsState extends State<GridViewWidgetPhysics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          ElevatedButton(onPressed: () {}, child: const Text('Close')),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              shrinkWrap: false,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              scrollDirection: Axis.vertical,
              children: [
                Image.network('https://picsum.photos/250?image=1'),
                Image.network('https://picsum.photos/250?image=2'),
                Image.network('https://picsum.photos/250?image=3'),
                Image.network('https://picsum.photos/250?image=4'),
                Image.network('https://picsum.photos/250?image=1'),
                Image.network('https://picsum.photos/250?image=2'),
                Image.network('https://picsum.photos/250?image=3'),
                Image.network('https://picsum.photos/250?image=4'),
                Image.network('https://picsum.photos/250?image=1'),
                Image.network('https://picsum.photos/250?image=2'),
                Image.network('https://picsum.photos/250?image=3'),
                Image.network('https://picsum.photos/250?image=4'),
                Image.network('https://picsum.photos/250?image=1'),
                Image.network('https://picsum.photos/250?image=2'),
                Image.network('https://picsum.photos/250?image=3'),
                Image.network('https://picsum.photos/250?image=4'),
                Image.network('https://picsum.photos/250?image=1'),
                Image.network('https://picsum.photos/250?image=2'),
                Image.network('https://picsum.photos/250?image=3'),
                Image.network('https://picsum.photos/250?image=4'),
                Image.network('https://picsum.photos/250?image=1'),
                Image.network('https://picsum.photos/250?image=2'),
                Image.network('https://picsum.photos/250?image=3'),
                Image.network('https://picsum.photos/250?image=4'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridViewWidgetFixedCount extends StatefulWidget {
  const GridViewWidgetFixedCount({super.key});

  @override
  State<GridViewWidgetFixedCount> createState() =>
      _GridViewWidgetFixedCountState();
}

class _GridViewWidgetFixedCountState extends State<GridViewWidgetFixedCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
          Image.network('https://picsum.photos/250?image=1'),
          Image.network('https://picsum.photos/250?image=2'),
          Image.network('https://picsum.photos/250?image=3'),
          Image.network('https://picsum.photos/250?image=4'),
        ],
      ),
    );
  }
}

class GridCount extends StatelessWidget {
  const GridCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'no need for gridDelegate:  \nSliverGridDelegateWithFixedCrossAxisCount')),
      body: Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24, right: 24),
            children: const [
              DialKey(number: '1', letters: ''),
              DialKey(number: '2', letters: 'ABC'),
              DialKey(number: '3', letters: 'DEF'),
              DialKey(number: '4', letters: 'GHI'),
              DialKey(number: '5', letters: 'JKL'),
              DialKey(number: '6', letters: 'MNO'),
              DialKey(number: '7', letters: 'PQRS'),
              DialKey(number: '8', letters: 'TUV'),
              DialKey(number: '9', letters: 'WXYZ'),
              DialKey(number: '*', letters: ''),
              DialKey(number: '0', letters: '+'),
              DialKey(number: '#', letters: ''),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class DialKey extends StatelessWidget {
  final String number;
  final String letters;

  const DialKey({super.key, required this.number, required this.letters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.grey.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                letters,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridBuilderDemo extends StatefulWidget {
  const GridBuilderDemo({super.key});

  @override
  _GridBuilderDemoState createState() => _GridBuilderDemoState();
}

class _GridBuilderDemoState extends State<GridBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Demo')),
      body: Column(
        children: [
          Container(color: Colors.grey, child: const TextField()),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return GridView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => ItemTile(index),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
                  childAspectRatio: 2,
                ),
              );
            }),
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
        tileColor: color.withOpacity(0.3),
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
