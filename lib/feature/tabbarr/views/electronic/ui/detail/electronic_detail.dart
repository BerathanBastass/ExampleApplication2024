import 'package:examplaapplication2024/core/utils/customColors.dart';
import 'package:examplaapplication2024/feature/product/view/detail/electronic_card_page.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/electronic/cubit/electornic_cubit.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/electronic/cubit/electornic_states.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/electronic/model/electronic_model.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/ui/cart/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';

import '../../../../../../core/app_localizations/app_localization.dart';

class ElectronicDetail extends StatelessWidget {
  final ElectronicModel electronic;

  ElectronicDetail({required this.electronic});

  @override
  Widget build(BuildContext context) {
    return NewScaffold(
      electronic: electronic,
    );
  }
}

class NewScaffold extends StatefulWidget {
  const NewScaffold({
    Key? key,
    required this.electronic,
  }) : super(key: key);

  final ElectronicModel electronic;

  @override
  _NewScaffoldState createState() => _NewScaffoldState();
}

class _NewScaffoldState extends State<NewScaffold> {
  late ElectronicCubit electronicCubit;

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        title: Text('${widget.electronic.title}'),
      ),
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: Transform.translate(
        offset: const Offset(0.0, -60.0),
        child: Column(
          children: [
            Image.network(
              widget.electronic.image,
              width: 100,
              height: 300,
              alignment: Alignment.center,
            ),
            Transform.translate(
              offset: const Offset(5.0, -60.0),
              child: Text(
                'Description \n${widget.electronic.description}',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            Row(
              children: [
                Transform.translate(
                  offset: Offset(0.0, -60.0),
                  child: Text(
                    '\$${widget.electronic.price}',
                    style: const TextStyle(
                      fontSize: 30,
                      decorationColor: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: const Offset(-50.0, -100.0),
                child: Text(
                  ' ${widget.electronic.rating.count}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: const Offset(-20.0, -135.0),
                child: const Icon(
                  FontAwesomeIcons.eye,
                ),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(-120.0, -166.0),
                  child: Text(
                    '${widget.electronic.rating.rate} -',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(-225.0, -10.0),
                  child: Text(
                    AppLocalizations.of(context).translate('recommend'),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
              child: BlocProvider(
                create: (context) {
                  electronicCubit = context.read<ElectronicCubit>()
                    ..fetchFemale();
                  return electronicCubit;
                },
                child: BlocBuilder<ElectronicCubit, ElectronicState>(
                  builder: (context, state) {
                    if (state is InitElectronicState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LoadingElectronicState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ResponseElectronicState) {
                      return Container(
                        height: 150,
                        width: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.electronicModel.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ElectronicDetail(
                                          electronic:
                                              state.electronicModel[index]))),
                              child: ElectronicCard(
                                  electronicModel:
                                      state.electronicModel[index]),
                            );
                          },
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        color: _theme.scaffoldBackgroundColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.electronic.price}',
                style: const TextStyle(fontSize: 30),
                selectionColor: _theme.scaffoldBackgroundColor,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  iconColor:
                      MaterialStateProperty.all(_theme.scaffoldBackgroundColor),
                  backgroundColor:
                      MaterialStateProperty.all(CustomColors.orangeColor),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCart()));
                },
                icon: const Icon(
                  FontAwesomeIcons.creditCard,
                  color: Colors.black,
                ),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
