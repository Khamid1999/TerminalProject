import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/language_choose/presentation/widgets/custom_button.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/second_step/presentation/bloc/crypto_select_bloc.dart';
import 'package:terminal_project/src/second_step/presentation/widgets/crypto_card.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class SecondStepPage extends StatelessWidget {
  const SecondStepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width * 0.44;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final bloc = BlocProvider.of<CryptoSelectBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'create_a_payment_without_mark'.tr(),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: BlocBuilder<CryptoSelectBloc, CryptoSelectState>(
            bloc: bloc,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppSpacings.vert20,
                  Center(
                    child: Text(
                      'step_two'.tr(),
                      style:
                          AppStyles.textFieldHintStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  AppSpacings.vert16,
                  Text(
                    "choose_crypto".tr(),
                    textAlign: TextAlign.center,
                    style: AppStyles.mainBlackTextStyle.copyWith(
                      fontSize: 45,
                    ),
                  ),
                  AppSpacings.vert32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/bitcoin.svg',
                        label: "bitcoin".tr(),
                        onSelect: () {
                          // eto onTap func
                          context.read<CryptoSelectBloc>().add(
                                SelectCryptoCurrencyEvent(
                                  isSelected: bloc.bitCoinSelected,
                                  cryptoCurrency: 'Bitcoin',
                                ),
                              );
                        },
                        selected: bloc.bitCoinSelected, //eto boolean
                      ),
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/ethereum.svg',
                        label: 'ethereum'.tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.ethereumSelected,
                              cryptoCurrency: 'Ethereum',
                            ),
                          );
                        },
                        selected: bloc.ethereumSelected,
                      ),
                    ],
                  ),
                  AppSpacings.vert16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/doge_coin.svg',
                        label: "doge_coin".tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.dogeCoinSelected,
                              cryptoCurrency: 'DogeCoin',
                            ),
                          );
                        },
                        selected: bloc.dogeCoinSelected,
                      ),
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/lite_coin.svg',
                        label: 'lite_coin'.tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.dogeCoinSelected,
                              cryptoCurrency: 'DogeCoin',
                            ),
                          );
                        },
                        selected: bloc.litecoinSelected,
                      ),
                    ],
                  ),
                  AppSpacings.vert16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/dash_coin.svg',
                        label: "dash".tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.dogeCoinSelected,
                              cryptoCurrency: 'DogeCoin',
                            ),
                          );
                        },
                        selected: bloc.dashCoinSelected,
                      ),
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/ripple_coin_xrp.svg',
                        label: 'ripple'.tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.dogeCoinSelected,
                              cryptoCurrency: 'DogeCoin',
                            ),
                          );
                        },
                        selected: bloc.rippleSelected,
                      ),
                    ],
                  ),
                  AppSpacings.vert16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/binance_coin.svg',
                        label: "binance_coin".tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.dogeCoinSelected,
                              cryptoCurrency: 'DogeCoin',
                            ),
                          );
                        },
                        selected: bloc.binanceCoinSelected,
                      ),
                      CryptoCard(
                        width: cardWidth,
                        avatarUrl: 'assets/images/usdt_coin.svg',
                        label: 'usdt'.tr(),
                        onSelect: () {
                          context.read<CryptoSelectBloc>().add(
                            SelectCryptoCurrencyEvent(
                              isSelected: bloc.dogeCoinSelected,
                              cryptoCurrency: 'DogeCoin',
                            ),
                          );
                        },
                        selected: bloc.usdtCoinSelected,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomSheet: isKeyboard
          ? Container(
              height: 0,
            )
          : Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 60, left: 20, right: 20),
              child: CustomButton.text(
                labelStyle: AppStyles.mainWhiteTextStyle.copyWith(
                  fontSize: 25,
                ),
                backgroundColor: AppColors.green,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.thirdStepPage);
                },
                height: 60,
                label: 'next_step'.tr(),
              ),
            ),
    );
  }
}
