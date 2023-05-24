import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/meal.dart';

final List<String> imgList = [
  'assets/polevky/Borsc.jpg',
  'assets/polevky/Bramborova.jpg',
  'assets/polevky/Brokolicova.jpg',
  'assets/polevky/Cesnekova_polevka_s_bramborami.jpg',
  'assets/polevky/Cockova.jpg',
  'assets/polevky/Drstkova.jpg',
  'assets/polevky/Drubezi_vyvar_s_masem_a_nudlemi.jpg',
  'assets/polevky/Fazolova.jpg',
  'assets/polevky/Frankfurtska.jpg',
  'assets/polevky/Gulasova.jpg',
  'assets/polevky/Hovezi_vyvar_s_jatrovymi_knedlicky.jpg',
  'assets/polevky/Hovezi_vyvar_s_masem_a_nudlemi.jpg',
  'assets/polevky/Hrachova_se_smazenym_hraskem.jpg',
  'assets/polevky/Krupicova_s_vejcem.jpg',
  'assets/polevky/Kulajda.jpg',
  'assets/polevky/Kvetakova.jpg',
  'assets/polevky/Porkova_s_vejcem.jpg',
  'assets/polevky/Rajska_s_ryzi.jpg',
  'assets/polevky/Zeleninova.jpg',
  'assets/polevky/Zelna_s_uzeninou.jpg',
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final json = await rootBundle.loadString('assets/meal_images_map.json');

  final List<Meal> meals =
      List.from(jsonDecode(json)).map((json) => Meal.fromJson(json)).toList();

  runApp(CarouselDemo(meals: meals));
}

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key, required List<Meal> meals});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const CarouselDemoHome(),
            // '/basic': (ctx) => const BasicDemo(),
            // '/nocenter': (ctx) => const NoCenterDemo(),
            // '/image': (ctx) => const ImageSliderDemo(),
            // '/complicated': (ctx) => const ComplicatedImageDemo(),
            // '/enlarge': (ctx) => const EnlargeStrategyDemo(),
            // '/manual': (ctx) => const ManuallyControlledSlider(),
            // '/noloop': (ctx) => const NoonLoopingDemo(),
            '/vertical': (ctx) => const VerticalSliderDemo(
                  meals: [],
                ),
            // '/fullscreen': (ctx) => const FullscreenSliderDemo(),
            // '/ondemand': (ctx) => const OnDemandCarouselDemo(),
            '/indicator': (ctx) => const CarouselWithIndicatorDemo(),
            // '/prefetch': (ctx) => const PrefetchImageDemo(),
            '/reason': (ctx) => const CarouselChangeReasonDemo(),
            '/position': (ctx) => const KeepPageviewPositionDemo(),
            // '/multiple': (ctx) => const MultipleItemDemo(),
            // '/zoom': (ctx) => const EnlargeStrategyZoomDemo(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  const DemoItem(this.title, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel demo'),
        actions: [
          IconButton(
              icon: const Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: const <Widget>[
          // DemoItem('Basic demo', '/basic'),
          // DemoItem('No center mode demo', '/nocenter'),
          // DemoItem('Image carousel slider', '/image'),
          // DemoItem('More complicated image slider', '/complicated'),
          // DemoItem('Enlarge strategy demo slider', '/enlarge'),
          // DemoItem('Manually controlled slider', '/manual'),
          // DemoItem('Noon-looping carousel slider', '/noloop'),
          DemoItem('Vertical carousel slider', '/vertical'),
          // DemoItem('Fullscreen carousel slider', '/fullscreen'),
          // DemoItem('Carousel with indicator controller demo', '/indicator'),
          // DemoItem('On-demand carousel slider', '/ondemand'),
          // DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
          // DemoItem('Carousel change reason demo', '/reason'),
          // DemoItem('Keep pageview position demo', '/position'),
          // DemoItem('Multiple item in one screen demo', '/multiple'),
          // DemoItem('Enlarge strategy: zoom demo', '/zoom'),
        ],
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: list
            .map((item) => Container(
                  color: Colors.green,
                  child: Center(child: Text(item.toString())),
                ))
            .toList(),
      )),
    );
  }
}

class NoCenterDemo extends StatelessWidget {
  const NoCenterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
        ),
        items: list
            .map((item) => Container(
                  color: Colors.green,
                  child: Text(item.toString()),
                ))
            .toList(),
      )),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  const ImageSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image slider demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
            .toList(),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                //the main card shape
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 500.0),
                    // gradiator
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}

class EnlargeStrategyDemo extends StatelessWidget {
  const EnlargeStrategyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  const ManuallyControlledSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manually controlled slider')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 200),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(imgList.length).map(
                    (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () => _controller.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class NoonLoopingDemo extends StatelessWidget {
  const NoonLoopingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noon-looping carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

class VerticalSliderDemo extends StatelessWidget {
  final List<Meal> meals;

  const VerticalSliderDemo({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Vertical sliding carousel demo')),
      backgroundColor: Colors.pink,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/meal_images_map.json'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final jsonContent = snapshot.data!;
            final List<Meal> meals = List.from(jsonDecode(jsonContent))
                .map((json) => Meal.fromJson(json))
                .where((meal) => meal.category == 'sladka_jidla')
                .toList();

            return SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        // height: 300,
                        aspectRatio: 2,
                        viewportFraction: 0.9,
                        initialPage: Random().nextInt(meals.length),
                        enableInfiniteScroll: true,
                        animateToClosest: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 1),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        // onPageChanged:(index, reason) {},
                        // onScrolled:(index, reason) {},
                        // scrollPhysics:(index, reason) {},
                        pageSnapping: false,
                        scrollDirection: Axis.vertical,
                        pauseAutoPlayOnTouch: true,
                        pauseAutoPlayOnManualNavigate: true,
                        pauseAutoPlayInFiniteScroll: false,

                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enlargeFactor: 0.5,
                        disableCenter: false,
                        padEnds: true,
                        clipBehavior: Clip.hardEdge,
                      ),
                      items: meals
                          .map((meal) => Container(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                      //the main card shape
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)),
                                      child: Container(
                                        color: Colors.pink[200],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/${meal.category}/${meal.imgsource}',
                                                  fit: BoxFit.fill,
                                                  height: 200,
                                                ),

                                                // gradiator
                                                // Positioned(
                                                //   bottom: 0.0,
                                                //   left: 0.0,
                                                //   right: 0.0,
                                                //   child: Container(
                                                //     decoration: const BoxDecoration(
                                                //       gradient: LinearGradient(
                                                //         colors: [
                                                //           Color.fromARGB(200, 0, 0, 0),
                                                //           Color.fromARGB(0, 0, 0, 0)
                                                //         ],
                                                //         begin: Alignment.bottomCenter,
                                                //         end: Alignment.topCenter,
                                                //       ),
                                                //     ),
                                                //     padding: const EdgeInsets.symmetric(
                                                //         vertical: 10.0,
                                                //         horizontal: 10.0),
                                                //     child: Text(
                                                //       meal.titleDia,
                                                //       style: const TextStyle(
                                                //         color: Colors.white,
                                                //         fontSize: 20.0,
                                                //         fontWeight: FontWeight.bold,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Flexible(
                                              child: SizedBox(
                                                width: 300,
                                                child: Text(
                                                  meal.titleDia,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        // height: 300,
                        aspectRatio: 2,
                        viewportFraction: 0.9,
                        initialPage: Random().nextInt(meals.length),
                        enableInfiniteScroll: true,
                        animateToClosest: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 1),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        // onPageChanged:(index, reason) {},
                        // onScrolled:(index, reason) {},
                        // scrollPhysics:(index, reason) {},
                        pageSnapping: false,
                        scrollDirection: Axis.vertical,
                        pauseAutoPlayOnTouch: true,
                        pauseAutoPlayOnManualNavigate: true,
                        pauseAutoPlayInFiniteScroll: false,

                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enlargeFactor: 0.5,
                        disableCenter: false,
                        padEnds: true,
                        clipBehavior: Clip.hardEdge,
                      ),
                      items: meals
                          .map((meal) => Container(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                      //the main card shape
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)),
                                      child: Container(
                                        color: Colors.pink[200],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/${meal.category}/${meal.imgsource}',
                                                  fit: BoxFit.fill,
                                                  height: 200,
                                                ),

                                                // gradiator
                                                // Positioned(
                                                //   bottom: 0.0,
                                                //   left: 0.0,
                                                //   right: 0.0,
                                                //   child: Container(
                                                //     decoration: const BoxDecoration(
                                                //       gradient: LinearGradient(
                                                //         colors: [
                                                //           Color.fromARGB(200, 0, 0, 0),
                                                //           Color.fromARGB(0, 0, 0, 0)
                                                //         ],
                                                //         begin: Alignment.bottomCenter,
                                                //         end: Alignment.topCenter,
                                                //       ),
                                                //     ),
                                                //     padding: const EdgeInsets.symmetric(
                                                //         vertical: 10.0,
                                                //         horizontal: 10.0),
                                                //     child: Text(
                                                //       meal.titleDia,
                                                //       style: const TextStyle(
                                                //         color: Colors.white,
                                                //         fontSize: 20.0,
                                                //         fontWeight: FontWeight.bold,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Flexible(
                                              child: SizedBox(
                                                width: 300,
                                                child: Text(
                                                  meal.titleDia,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Error loading JSON file');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  const FullscreenSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class OnDemandCarouselDemo extends StatelessWidget {
  const OnDemandCarouselDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('On-demand carousel demo')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: 100,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Container(
            child: Text(index.toString()),
          );
        },
      )),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  const PrefetchImageDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prefetch image slider demo')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Container(
            child: Center(
                child: Image.network(images[index],
                    fit: BoxFit.cover, width: 1000)),
          );
        },
      )),
    );
  }
}

class CarouselChangeReasonDemo extends StatefulWidget {
  const CarouselChangeReasonDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonDemoState();
  }
}

class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Change reason demo')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: onPageChange,
                  autoPlay: true,
                ),
                carouselController: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.previousPage(),
                    child: const Text('←'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.nextPage(),
                    child: const Text('→'),
                  ),
                ),
                ...Iterable<int>.generate(imgList.length).map(
                  (int pageIndex) => Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.animateToPage(pageIndex),
                      child: Text("$pageIndex"),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const Text('page change reason: '),
                  Text(reason),
                ],
              ),
            )
          ],
        ));
  }
}

class KeepPageviewPositionDemo extends StatelessWidget {
  const KeepPageviewPositionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keep pageview position demo')),
      body: ListView.builder(itemBuilder: (ctx, index) {
        if (index == 3 || index == 5) {
          return Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 3.0,
              enlargeCenterPage: true,
              pageViewKey: const PageStorageKey<String>('carousel_slider'),
            ),
            items: imageSliders,
          ));
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            height: 50,
            child: const Center(
              child: Text('other content'),
            ),
          );
        }
      }),
    );
  }
}

class MultipleItemDemo extends StatelessWidget {
  const MultipleItemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple item in one slide demo')),
      body: Container(
          child: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
        itemCount: (imgList.length / 2).round(),
        itemBuilder: (context, index, realIdx) {
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map((idx) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(imgList[idx], fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        },
      )),
    );
  }
}

class EnlargeStrategyZoomDemo extends StatelessWidget {
  const EnlargeStrategyZoomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('enlarge strategy: zoom demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.4,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
