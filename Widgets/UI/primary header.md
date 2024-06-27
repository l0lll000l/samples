

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        color: TColors.primary,
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.light.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.light.withOpacity(0.1),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}

![Screenshot_1719478292](https://github.com/l0lll000l/samples/assets/114205296/568af516-a43d-43c2-a480-84b8c3a0c9fc)
