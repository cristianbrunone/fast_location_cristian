import 'package:fast_location/scr/shared/imports/imports.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? action;

  const AppButton({Key? key, required this.label, this.action})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: AppColors.appPrimary,
          foregroundColor: Colors.white,
        ),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
      ),
    );
  }
}
