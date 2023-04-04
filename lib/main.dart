import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home.dart';

void main(List<String> args) {
  runApp(InstaApp());
}

class InstaApp extends StatefulWidget {
  InstaApp({super.key});

  @override
  State<InstaApp> createState() => _InstaAppState();
}

class _InstaAppState extends State<InstaApp>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(),
        body: Home(),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: TabBar(
              indicatorColor: Colors.transparent,
              controller: tabController,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                Tab(
                  icon: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/search.svg",width: 32,height: 32,colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),))
                ),
                Tab(
                  icon: Container(
                    width: 25,
                    height:25,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/plus.png"),colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn))
                    ),
                  )
                ),
                 Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Container(
                      width: 30,
                      height:30,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/igtv.png"),colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn))
                      ),
                    ),
                  )
                ),
                Tab(
                  icon: profile(),
                )
              ]),
        ),
      ),
    );
  }

  Widget profile() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
              image: AssetImage("assets/profile.jpeg"), fit: BoxFit.cover)),
    );
  }

  //AppBar
  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Instagram",
          style: TextStyle(fontSize: 28, fontFamily: "instab"),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 36,
          width: 36,
          child: const Icon(Icons.favorite_border),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/dm_logo.png"))),
        ),
      ],
    );
  }
}
