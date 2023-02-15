import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:wapper/app/data/model/profissionalModel.dart';

import 'package:wapper/app/data/model/servicoModel.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';

class ServiceParceiroController extends GetxController {
  final ServicoModel servico;
  final profissionalSelecionado = Rxn<ProfissionalModel>();
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

    while (hoursAdd < profissionalSelecionado.value!.fimAtendimento!.hour) {
      timersPicks.add(TimePickModel(
          timeOfDay: TimeOfDay(
              hour: profissionalSelecionado.value!.inicioAtendimento!.hour + count,
              minute: profissionalSelecionado.value!.inicioAtendimento!.minute)));
      count++;
      hoursAdd = profissionalSelecionado.value!.inicioAtendimento!.hour + count;
    }
  }
}

class TimePickModel {
  TimeOfDay timeOfDay;
  bool isSelected;

  TimePickModel({required this.timeOfDay, this.isSelected = false});
}
