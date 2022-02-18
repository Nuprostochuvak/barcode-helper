import 'package:flutter/material.dart';
import 'package:google_sheet_db/models/barcode.dart';
import 'package:google_sheet_db/models/barcode_list_model.dart';

import 'package:google_sheet_db/widgets/barcode_card_widget.dart';

class ConfigBarcodesPage extends StatefulWidget {
  const ConfigBarcodesPage({Key? key}) : super(key: key);

  @override
  _ConfigBarcodesPageState createState() => _ConfigBarcodesPageState();
}

class _ConfigBarcodesPageState extends State<ConfigBarcodesPage> {
  final model = BarcodesListModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BarcodesListModelProvider(
          model: model,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: BarcodesWidget(),
                ),
              ),
              Row(
                children: [
                  Expanded(child: const _WebLoadButton()),
                  Expanded(child: const _LocalLoadButton()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WebLoadButton extends StatelessWidget {
  const _WebLoadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          BarcodesListModelProvider.read(context)?.model.loadWebBarcodes(),
      child: const Text('Загрузить штрихкоды'),
    );
  }
}

class _LocalLoadButton extends StatelessWidget {
  const _LocalLoadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          BarcodesListModelProvider.read(context)?.model.loadLocalBarcodes(),
      child: const Text('Загрузить локально'),
    );
  }
}

class BarcodesWidget extends StatelessWidget {
  const BarcodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarcodesListModel model = BarcodesListModelProvider.read(context)!.model;

    return Scrollbar(
      thickness: 8,
      child: FutureBuilder(
          future: model.getLocalBarcodes(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            final List<Barcode> barcode = snapshot.data as List<Barcode>;
            return ListView.builder(
              itemCount: BarcodesListModelProvider.watch(context)
                      ?.model
                      .barcodes
                      .length ??
                  0,
              itemBuilder: (BuildContext context, int index) {
                return BarcodesRowWidget(
                  index: index,
                );
              },
            );
          }),
    );
  }
}

/*class BarcodesWidget extends StatelessWidget {
  const BarcodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 8,
      child: ListView.builder(
        itemCount:
            BarcodesListModelProvider.watch(context)?.model.barcodes.length ??
                0,
        itemBuilder: (BuildContext context, int index) {
          return BarcodesRowWidget(
            index: index,
          );
        },
      ),
    );
  }
}*/

class BarcodesRowWidget extends StatelessWidget {
  final int index;
  const BarcodesRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barcode =
        BarcodesListModelProvider.read(context)!.model.barcodes[index];
    String name = (barcode.name == '') ? 'Имя еще не задано' : barcode.name;

    String description = (barcode.description == '')
        ? 'Описание еще не задано'
        : barcode.description;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          barcodeCardWidget(context, barcode),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
