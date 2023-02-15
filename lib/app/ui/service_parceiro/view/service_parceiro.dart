import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:wapper/app/data/model/servicoModel.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/form_field_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/service_parceiro/controller/service_parceiro_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class ServicoParceiro extends StatelessWidget {
  final ServicoModel servico;
  const ServicoParceiro({Key? key, required this.servico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceParceiroController(servico: servico));
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Serviço',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextComponent(
                      controller.servico.titulo ?? '',
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: TextComponent(
                              controller.servico.resumo ?? '',
                              color: cinzaPadrao,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 16),
                    child: TextComponent(
                      'Selecione o Profissional',
                      fontWeight: FontWeight.w600,
                      color: fontColor,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                      ),
                      elevation: 0,
                      builder: (BuildContext context) {
                        return Container(
                          height: Get.height / 2,
                          child: ListView.builder(
                            itemCount: controller.servico.profissionais?.length ?? 0,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      color: azulPadrao,
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextComponent(
                                              '${controller.servico.profissionais?[index].nome!.split(' ').first[0].toUpperCase()}',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: new Text(controller.servico.profissionais?[index].nome ?? ''),
                                  subtitle: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            size: 15,
                                            Icons.star,
                                            color: amareloPadrao,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          TextComponent(
                                            '4,5',
                                            color: amareloPadrao,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            child: TextComponent(
                                              controller.servico.profissionais?[index].resumo ?? '',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Get.back();
                                    controller.selecionarProfissional(controller.servico.profissionais![index]);
                                  });
                            }),
                          ),
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(80), color: backgroundFieldColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Obx(() => controller.profissionalSelecionado.value != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: azulPadrao,
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextComponent(
                                                '${controller.profissionalSelecionado.value!.nome!.split(' ').first[0].toUpperCase()}',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: azulPadrao,
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextComponent(
                                                '?',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                            ),
                            Obx(
                              () => controller.profissionalSelecionado.value != null
                                  ? Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  TextComponent(
                                                    controller.profissionalSelecionado.value?.nome ?? '',
                                                    color: fontColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    size: 15,
                                                    Icons.star,
                                                    color: amareloPadrao,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  TextComponent(
                                                    '4,5',
                                                    color: amareloPadrao,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Container(
                                                    child: TextComponent(
                                                      controller.profissionalSelecionado.value?.resumo ?? '',
                                                      color: cinzaPadrao,
                                                      textOverflow: TextOverflow.ellipsis,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    )
                                  : Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Row(
                                            children: [
                                              TextComponent(
                                                'Selecione o profissional',
                                                color: fontColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          )),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    size: 40,
                                    Icons.keyboard_arrow_down,
                                    color: fontColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 16),
                        child: TextComponent(
                          'Selecione a data',
                          fontWeight: FontWeight.w600,
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => TableCalendar(
                      firstDay: controller.kFirstDay,
                      lastDay: controller.kLastDay,
                      focusedDay: controller.focusedDay.value,
                      calendarStyle: CalendarStyle(
                          selectedDecoration: const BoxDecoration(color: Color.fromARGB(255, 0, 21, 79), shape: BoxShape.circle),
                          todayDecoration: const BoxDecoration(color: Color.fromARGB(100, 0, 21, 79), shape: BoxShape.circle)),
                      availableCalendarFormats: const {
                        CalendarFormat.twoWeeks: 'TwoWeeks',
                      },
                      calendarFormat: controller.calendarFormat.value,
                      locale: 'en_US',
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.diaSelecionado.value, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(controller.diaSelecionado.value, selectedDay)) {
                          controller.diaSelecionado.value = selectedDay;
                          controller.focusedDay.value = focusedDay;
                        }
                      },
                      onFormatChanged: (format) {
                        if (controller.calendarFormat.value != format) {
                          controller.calendarFormat.value = format;
                        }
                      },
                      onPageChanged: (focusedDay) {
                        controller.focusedDay.value = focusedDay;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 16),
                        child: TextComponent(
                          'Selecione o horário',
                          fontWeight: FontWeight.w600,
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                color: azulPadrao,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Center(
                                  child: TextComponent(
                                    '08:00',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextComponent(
                        'Alguma observação ?',
                        color: fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    maxLength: 140,
                    hintText: 'Ex: Chegarei 5 minutos adiantado do horário marcado...',
                    counterText: true,
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: Get.width * 0.70,
                child: ButtonComponent(
                  backgroundColor: azulPadrao,
                  titulo: 'Confirmar',
                  onPressed: () {
                    Get.toNamed('/cart-page');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
