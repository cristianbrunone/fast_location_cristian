import 'package:fast_location/scr/shared/imports/imports.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.loadData();
  }

  void showCepSearchDialog(BuildContext context) {
    final TextEditingController _localCepController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Digite o CEP',
                  style: TextStyle(
                    color: AppColors.appPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _localCepController,
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.appPrimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appPrimary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                AppButton(
                  label: 'Buscar',
                  action: () async {
                    final cep = _localCepController.text;
                    if (cep.length == 8) {
                      Navigator.of(context).pop();
                      await _controller.getAddressByCep(
                        cep,
                      ); // <-- usa seu controller normalmente
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('CEP inválido. Deve conter 8 dígitos.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.appPageBackground,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/arrow.svg',
                          width: 30,
                          height: 30,
                          colorFilter: ColorFilter.mode(
                            AppColors.appPrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Fast Location',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.appPrimary,
                            fontFamily: GoogleFonts.bebasNeue().fontFamily,
                            letterSpacing: 1.12,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),
                    _controller.selectedAddress != null
                        ? SearchAddress(address: _controller.selectedAddress!)
                        : const SearchEmpty(),
                    const SizedBox(height: 20),
                    AppButton(
                      label: 'Localizar endereço',
                      action: () {
                        showCepSearchDialog(context);
                      },
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                            color: AppColors.appPrimary,
                          ),
                          const SizedBox(width: 1),
                          Text(
                            'Últimos endereços localizados',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.appPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    AddressList(addressList: _controller.recentList),
                    const SizedBox(height: 24),
                    AppButton(
                      label: 'Histórico de endereços',
                      action: () {
                        Navigator.pushNamed(context, AppRouter.history);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.appPrimary,
            onPressed: _controller.openMapWithLastAddress,
            child: const Icon(Icons.fork_right, color: Colors.white, size: 32),
            shape: const CircleBorder(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6,
            elevation: 12,
            height: 50,
          ),
        );
      },
    );
  }
}
