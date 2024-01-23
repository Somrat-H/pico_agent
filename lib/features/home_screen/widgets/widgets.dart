part of '../home_screen_view.dart';

class _CustomBox extends StatelessWidget {
  final String servieceName;
  final String serviecLogo;
  final VoidCallback onTap;

  const _CustomBox({
    required this.servieceName,
    required this.serviecLogo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowdownColor,
              offset: const Offset(2, 2),
              blurRadius: 15,
            ),
            BoxShadow(
              color: shadowupColor,
              offset: const Offset(-2, -2),
              blurRadius: 15,
            ),
          ],
          color: Colors.white,
          image: DecorationImage(image: AssetImage(serviecLogo))),
      child: Column(
        children: [
          // Expanded(child: Text(servieceName, style: titleTextStyle)),
          const Expanded(child: SizedBox()),
          const Divider(),
          MaterialButton(
              color: Colors.teal,
              onPressed:onTap,
              minWidth: double.infinity,
              child: Text(servieceName.toString())),
        ],
      ),
    );
  }
}
