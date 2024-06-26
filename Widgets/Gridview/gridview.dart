
class TGridview extends StatelessWidget {
  const TGridview({
    super.key,
    this.itemcount = 6,
  });
  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemcount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 270,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          crossAxisCount: 2),
      itemBuilder: (context, index) => const TProductCardVertical(),
    );
  }
}
