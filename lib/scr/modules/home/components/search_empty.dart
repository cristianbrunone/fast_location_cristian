import 'package:fast_location/scr/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.directions, size: 80, color: AppColors.appPrimary),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Faça uma busca para localizar seu destino",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
