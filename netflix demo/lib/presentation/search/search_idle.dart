import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //******************************************************************************* */
          const SearchWidgetTitle(
            title: 'Top Searches', //                      title
          ),
          //******************************************************************************* */
          kHeight,
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text('error while getting data'),
                  );
                } else if (state.idleList.isEmpty) {
                  return const Center(
                    child: Text('list is empty'),
                  );
                } else {
                  //************************************************************************ */
                  return ListView.separated(
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        //******************************************************************************* */
                        final movie = state.idleList[index];
                        return TopSearchItemTile(
                            title: movie.title ?? 'no title provided',
                            imageUrl:
                                '$imageAppendurl${movie.posterpath}' ?? '');
                        //   image, name and play button
                        //******************************************************************************* */
                      },
                      separatorBuilder: (context, index) {
                        return kHeight;
                      },
                      itemCount: state.idleList.length);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

//********************************************************************************************* */
class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
              color: kwhite,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        )),
        const Icon(
          Icons.play_circle,
          size: 43,
        ),
      ],
    );
  }
}
//********************************************************************************************* */
