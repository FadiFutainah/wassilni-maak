import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:wassilni_maak/application/order/order_cubit.dart';
import 'package:wassilni_maak/data/providers/global_data.dart';
import 'package:wassilni_maak/domain/models/contact_model.dart';

import '../widgets/widgets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'اختر وسيلة النقل'),
      body: BlocProvider(
        create: (context) => OrderCubit(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                return SizedBox(
                  height: 65.h,
                  child: ListView.builder(
                    itemCount: vehicles!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                          side: BorderSide(
                            color: context
                                .read<OrderCubit>()
                                .tileBorderColor(index),
                          ),
                        ),
                        elevation: 3,
                        child: ListTile(
                          onTap: () {
                            context.read<OrderCubit>().select(index);
                          },
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(13),
                          //   side: BorderSide(
                          //       color: context
                          //           .read<OrderCubit>()
                          //           .tileBorderColor(index)),
                          // ),
                          // tileColor: context.read<OrderCubit>().tileColor(index),
                          leading: CachedNetworkImage(
                            imageUrl: vehicles![index].image,
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                          title: Text(
                            vehicles![index].name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: Text(
                            '${vehicles![index].calculatePrice(distance!)} ل.س',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const LineTitleLine(text: 'الطلب عبر'),
            const SizedBox(height: 20),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextIconButton(
                      text: 'whatsapp',
                      icon: FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                      onPressed: () async {
                        await context
                            .read<OrderCubit>()
                            .sendMessageVia(ContactApp.whatsapp);
                      },
                    ),
                    TextIconButton(
                      text: '  SMS',
                      icon: FontAwesomeIcons.message,
                      color: Colors.yellow[700],
                      onPressed: () async {
                        await context
                            .read<OrderCubit>()
                            .sendMessageVia(ContactApp.sms);
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
