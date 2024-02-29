import 'package:examplaapplication2024/core/app_localizations/app_localization.dart';
import 'package:examplaapplication2024/core/utils/customColors.dart';
import 'package:examplaapplication2024/feature/product/view/detail/demo_card_page.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/cubit/mixed_cubit.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/cubit/mixed_states.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/model/mixed_models.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/mixed/ui/cart/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';

class MixedDetailPage extends StatelessWidget {
  final Products product;

  MixedDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return NewScaffold(
      product: product,
    );
  }
}

class NewScaffold extends StatefulWidget {
  const NewScaffold({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  _NewScaffoldState createState() => _NewScaffoldState();
}

class _NewScaffoldState extends State<NewScaffold> {
  late MixedCubit mixedCubit;

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        title: Text('${widget.product.title}'),
      ),
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: Transform.translate(
        offset: const Offset(0.0, -60.0),
        child: Column(
          children: [
            Image.network(
              widget.product.image,
              width: 100,
              height: 300,
              alignment: Alignment.center,
            ),
            Transform.translate(
              offset: const Offset(5.0, -60.0),
              child: Text(
                'Description \n${widget.product.description}',
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
                    '\$${widget.product.price}',
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
                  ' ${widget.product.rating.count}',
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
                    '${widget.product.rating.rate} -',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(-228.0, -10.0),
                  child: Text(
                    AppLocalizations.of(context).translate('recommend'),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
              child: BlocProvider(
                create: (context) {
                  mixedCubit = context.read<MixedCubit>()..fetchProducts();
                  return mixedCubit;
                },
                child: BlocBuilder<MixedCubit, MixedState>(
                  builder: (context, state) {
                    if (state is InitMixedState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LoadingMixedState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ResponseMixedState) {
                      return Container(
                        height: 150,
                        width: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MixedDetailPage(
                                          product: state.products[index]))),
                              child: ShotCard(product: state.products[index]),
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
                '\$${widget.product.price}',
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
