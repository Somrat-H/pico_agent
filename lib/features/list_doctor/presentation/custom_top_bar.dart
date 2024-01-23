part of 'doctor_details.dart';

class _CustomTopBar extends StatelessWidget {
  const _CustomTopBar({
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
                context.go(AppRoute.listDoctor);
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
          "Doctor Details",
          textAlign: TextAlign.center,
          style:
              textTheme.titleLarge?.copyWith(color: colorScheme.onBackground),
        )
      ],
    );
  }
}
