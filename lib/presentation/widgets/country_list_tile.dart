import 'package:app_with_api/domain/entity/country.dart';
import 'package:app_with_api/presentation/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryListTile extends StatelessWidget {
  final Country country;

  const CountryListTile({required this.country, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: country.alpha2Code != null ? Text(country.alpha2Code!) : null,
      title: Text(country.name.toString()),
      subtitle: country.subregion != null ? Text(country.subregion!) : null,
      trailing: country.flagUrl != null
          ? SizedBox(
              child: SvgPicture.network(
                country.flagUrl!,
                width: 50,
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ),
            )
          : null,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CountryScreen(country: country);
        }));
      },
    );
  }
}
