// import 'dart:ffi';
import 'package:weiyan/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:weiyan/widget/home_widget/home_head.dart';
import 'package:weiyan/widget/home_widget/home_appbar.dart';
import 'package:provider/provider.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:weiyan/widget/textitem_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '微言',
        home: Scaffold(
          body: Container(
            // decoration: BoxDecoration(color: Colors.blueAccent),
            child: Home(),
          ),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          child: Stack(
              // alignment: Alignment.bottomCenter,
              // children: <Widget>[ContentList()],
              children: <Widget>[TextItemPage()]),
        ),
        Positioned(
          top: 0,
          height: 80,
          width: screenWidth,
          child: Container(
            child: TopTab(),
          ),
        ),
      ],
    );
  }
}

class TopTab extends StatefulWidget {
  const TopTab({super.key});

  @override
  State<TopTab> createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
              flex: 2,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  // Calendar()
                ],
              )),
          Flexible(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                width: 240,
                child: SizedBox(),
                // child: TabBar(
                //   controller: _controller,
                //   indicator: const BoxDecoration(),
                //   labelStyle: TextStyle(fontSize: 25),
                //   unselectedLabelStyle: TextStyle(fontSize: 20),
                //   labelColor: Colors.black54,
                //   unselectedLabelColor: Colors.black54,
                //   tabs: <Widget>[
                //     InkWell(
                //       child: Text('图'),
                //       onTap: () {
                //         _controller.animateTo(0);
                //       },
                //     ),
                //     InkWell(
                //       child: Text('文'),
                //       onTap: () {
                //         _controller.animateTo(1);
                //       },
                //     ),
                //   ],
                // ),
              )),
          Flexible(
              flex: 2,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    color: Colors.black54,
                    onPressed: () {
                      Routes.navigateTo(context, '${Routes.settingPage}');
                    },
                  )
                ],
              ))
        ]);
  }
}

class TabPageView extends StatefulWidget {
  const TabPageView({super.key});

  @override
  State<TabPageView> createState() => _TabPageViewState();
}

class _TabPageViewState extends State<TabPageView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  List<String> _titleList = <String>['图', '文'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _titleList.length);
    _pageController = PageController();
  }

  void _changeTab(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int index) {
    _tabController.animateTo(index, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 50,
          // color: Color(0xFFc5e5f3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )),
              Flexible(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    width: 240,
                    child: TabBar(
                      controller: _tabController,
                      indicator: const BoxDecoration(),
                      labelStyle: TextStyle(fontSize: 18),
                      unselectedLabelStyle: TextStyle(fontSize: 15),
                      labelColor: Colors.black54,
                      unselectedLabelColor: Colors.black54,
                      onTap: _changeTab,
                      tabs: _titleList.map((e) => Tab(text: e)).toList(),
                    ),
                  )),
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        color: Colors.black54,
                        onPressed: () {
                          print('dianji');
                          Routes.navigateTo(context, '${Routes.feedbackPage}');
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
        Expanded(
            child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _titleList.length,
                itemBuilder: (context, index) {
                  return PageItemView(index: index);
                }))
      ],
    );
  }
}

class PageItemView extends StatelessWidget {
  final int? index;
  const PageItemView({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return index == 0 ? PictureItem() : TextItem();
  }
}

class PictureItem extends StatelessWidget {
  const PictureItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
              padding: const EdgeInsets.only(top: 70),
              color: Color(0xFFc5e5f3),
              child: Stack(children: [
                Container(
                  width: width,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  clipBehavior: Clip.hardEdge,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: new Image.network(
                    'https://c-ssl.duitang.com/uploads/blog/202207/02/20220702151717_fed79.jpeg',
                  ),
                ),
                Positioned(
                  bottom: 150,
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      '——jianghuihui',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: width,
                        padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                                SizedBox(width: 100),
                                Icon(
                                  Icons.ios_share,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                              ],
                            ),
                          ],
                        )))
              ]));
        });
  }
}

class TextItemPage extends StatelessWidget {
  const TextItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index) {
          return TextItem();
        });
  }
}