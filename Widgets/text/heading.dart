class TsectionHeading extends StatelessWidget {
  const TsectionHeading({
    super.key,
    this.title = 'Popular Catogories',
    this.buttonTitle = 'view all',
    this.textcolor = Colors.black,
    this.showActionButton = false,
    this.onpressed,
  });
  final String title, buttonTitle;
  final Color textcolor;
  final bool showActionButton;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textcolor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onpressed, child: Text(buttonTitle))
      ],
    );
  }
}
