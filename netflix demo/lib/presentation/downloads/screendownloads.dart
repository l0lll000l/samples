import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/download/downloads_bloc.dart';

import 'package:netflix/widgets/appbar.dart';
import 'package:netflix/core/constants.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [
    const _Smartdownload(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: WidgetAppBar(title: 'Downloads'),
            ),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return _widgetList[index];
            },
            separatorBuilder: (context, index) {
              return kHeight;
            },
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});
  // final List imageList = [
  //   'https://m.media-amazon.com/images/I/71Jxq2p5YWL._AC_UF1000,1000_QL80_.jpg',
  //   'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
  //   'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/zZqpAXxVSBtxV9qPBcscfXBcL2w.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    final Size size = MediaQuery.of(context).size;

    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());

    return Column(
      children: [
        const Text(
          'introducing downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "we wil download a personalised selection of\n movies and shows for you,so there's\n always something to watch on your\n device",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.isloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.downloads!.isEmpty) {
              return const Center(
                child: Text('list is empty'),
              );
            } else {
              return SizedBox(
                width: size.width,
                height: size.width,
                child: state.isloading
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: size.width * .35,
                            ),
                          ),
//--------------------------------------------

//--------------------------------------------

                          Downloadsimagewidget(
                            imageList:
                                '$imageAppendurl${state.downloads?[1].posterpath}',
                            margin: const EdgeInsets.only(
                              left: 170,
                            ),
                            angle: 25,
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                          Downloadsimagewidget(
                            imageList:
                                '$imageAppendurl${state.downloads![2].posterpath}',
                            size: Size(size.width * 0.35, size.width * 0.55),
                            angle: -25,
                            margin: const EdgeInsets.only(
                              right: 170,
                            ),
                          ),
                          Downloadsimagewidget(
                            imageList:
                                '$imageAppendurl${state.downloads?[3].posterpath}',
                            size: Size(
                              size.width * 0.4,
                              size.width * 0.55,
                            ),
                            // angle: -20,
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                          ),
                        ],
                      ),
              );
            }
          },
        )
      ],
    );
  }
}

class _Smartdownload extends StatelessWidget {
  const _Smartdownload();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            color: kwhite,
          ),
          kwidth,
          Text('smart downloads')
        ],
      ),
    );
  }
}

class Downloadsimagewidget extends StatelessWidget {
  const Downloadsimagewidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * 3.14 / 180,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              // margin: margin,
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageList))),
            ),
          ),
        ),
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: kButtonColorBlue,
              onPressed: () {},
              child: const Text(
                'setup',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          kHeight,
          MaterialButton(
            color: kwhite,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: kBlack),
            ),
          ),
        ],
      ),
    );
  }
}

// 46 -   33.46
