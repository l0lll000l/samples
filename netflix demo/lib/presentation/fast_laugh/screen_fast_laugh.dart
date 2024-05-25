import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/FastLaugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_laugh/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
      },
    );
    return Scaffold(
        body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {
        //********************************************* */
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('error'),
          );
        } else if (state.videosList.isEmpty) {
          return const Center(
            child: Text('video list empty'),
          );
        } else {
          return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(10, (index) {
                return VideoListItem(
                  index: index,
                );
              }));
        }
        //******************************************************* */
      },
    )));
  }
}
