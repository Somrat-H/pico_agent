part of 'list_pathology.dart';

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.colorScheme,
    required this.textTheme,
  });

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton.filledTonal(
              color: Colors.white,
              splashColor: Colors.white,
              highlightColor: Colors.white,
              focusColor: Colors.white,
              disabledColor: Colors.white,
              onPressed: () {
                context.go(AppRoute.home);
              },
              icon: Icon(
                Icons.arrow_back,
                color: colorScheme.primary,
              )),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Pathoology List",
          textAlign: TextAlign.center,
          style:
              textTheme.titleLarge?.copyWith(color: colorScheme.onBackground),
        )
      ],
    );
  }
}
