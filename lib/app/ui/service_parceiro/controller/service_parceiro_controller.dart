import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:wapper/app/data/model/itemPedido.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/data/model/profissionalModel.dart';
import 'dart:developer' as lg;
import 'package:wapper/app/data/model/servicoModel.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';

class ServiceParceiroController extends GetxController {
  final ServicoModel servico;
  final profissionalSelecionado = Rxn<ProfissionalModel>();
  TextEditingController observacao = TextEditingController(text: '');
  Rxn diaSelecionado = Rxn<DateTime>();
  Rx calendarFormat = Rx<CalendarFormat>(CalendarFormat.twoWeeks);
  Rx<DateTime> focusedDay = Rx<DateTime>(DateTime.now());

  final DateTime kFirstDay = DateTime.now();
  final DateTime kLastDay = DateTime.now().add(Duration(days: 14));

  MaskFormatter maskFormatter = MaskFormatter();

  RxList<TimePickModel> timersPicks = RxList<TimePickModel>([]);

  Rxn horarioSelecionado = Rxn<TimePickModel>();

  final cartController = Get.find<CartController>(tag: 'cart_controller');

  ServiceParceiroController({required this.servico});

  @override
  void onInit() async {
    super.onInit();
  }

  void selecionarProfissional(ProfissionalModel profissional) {
    profissionalSelecionado.value = profissional;
    adicionarTimerPick();
  }

  void adicionarTimerPick() {
    int hoursAdd = 0;
    int count = 0;

    timersPicks.clear();

    while (hoursAdd < profissionalSelecionado.value!.fimAtendimento.hour) {
      timersPicks.add(TimePickModel(
          timeOfDay: TimeOfDay(
              hour: profissionalSelecionado.value!.inicioAtendimento.hour + count,
              minute: profissionalSelecionado.value!.inicioAtendimento.minute)));
      count++;
      hoursAdd = profissionalSelecionado.value!.inicioAtendimento.hour + count;
    }
  }

  void confirmar() {
    PedidoModel pedido = PedidoModel(
      horarioMarcado: horarioSelecionado.value.timeOfDay,
      cliente: cartController.clienteLogado.value!,
      observacao: observacao.text,
      valorPedido: 19.00,
      itemsPedido: [
        ItemPedidoModel(servicoModel: servico, profissionalModel: profissionalSelecionado.value!, valorItem: servico.valor)
      ],
    );

    lg.log(jsonEncode(pedido.toJson()));
  }
}

class TimePickModel {
  TimeOfDay timeOfDay;
  bool isSelected;

  TimePickModel({required this.timeOfDay, this.isSelected = false});
}
