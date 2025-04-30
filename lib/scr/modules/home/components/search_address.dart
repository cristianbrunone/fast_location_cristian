// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fast_location/scr/shared/imports/imports.dart';

class SearchAddress extends StatefulWidget {
  final AddressModel address;

  const SearchAddress({Key? key, required this.address}) : super(key: key);

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appContainerBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Dados da Localização",
                  style: TextStyle(
                    color: AppColors.appPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Logradouro/Rua: ",
                  style: TextStyle(
                    color: AppColors.appPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.address.publicPlace,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Bairro/Distrito: ",
                  style: TextStyle(
                    color: AppColors.appPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.address.neighborhood,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            if (widget.address.complement != '')
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Complemento: ",
                      style: TextStyle(
                        color: AppColors.appPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.address.complement ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Cidade/UF: ",
                  style: TextStyle(
                    color: AppColors.appPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.address.city}/${widget.address.state}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "CEP: ",
                  style: TextStyle(
                    color: AppColors.appPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.address.cep,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
