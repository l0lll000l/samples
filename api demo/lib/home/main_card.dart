import 'package:apidemo/applications/bloc/trending_bloc.dart';
import 'package:apidemo/constant/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const imageurl1 =
    "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/eHMh7kChaNeD4VTdMCXLJbRTzcI.jpg";

class MainCard1 extends StatelessWidget {
  final image2;
  const MainCard1({
    super.key,
    this.image2,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<TrendingBloc>(context).add(const GetTrendingImage());
    });

    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: kradius,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image2),
              ),
            ),
            height: 300,
            width: 200,
          ),
        );
      },
    );
  }
}
