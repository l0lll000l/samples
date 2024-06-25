   Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: CarouselSlider(items: const [
                  TRoundedImage(
                    imageurl: TImages.banner1,
                  ),
                  TRoundedImage(
                    imageurl: TImages.banner2,
                  ),
                  TRoundedImage(
                    imageurl: TImages.banner3,
                  ),
                  TRoundedImage(
                    imageurl: TImages.banner4,
                  ),
                ], options: CarouselOptions(viewportFraction: 1)))
