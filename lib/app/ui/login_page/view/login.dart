import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/form_field_component.dart';
import 'package:wapper/app/ui/login_page/controller/login_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/validacao_email.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: amareloPadrao,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/app/assets/img/splash.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Wapper',
                  style: TextStyle(fontFamily: 'OleoScript', fontSize: 64, decoration: TextDecoration.none, color: Colors.white),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Form(
                  key: controller.formLoginKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width / 1.5,
                        child: InputFormFieldComponent(
                          controller: controller.email,
                          autofocus: true,
                          hintText: 'E-mail',
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(controller.nextFocus);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-mail é obrigatório!';
                            }
                            if (!ValidacaoEmail.validarEmail(value)) {
                              return 'E-mail inválido';
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Obx(
                        () => SizedBox(
                          width: Get.width / 1.5,
                          child: InputFormFieldComponent(
                            focusNode: controller.nextFocus,
                            hintText: 'Senha',
                            suffixIcon: GestureDetector(
                              onTap: () => controller.visibility(!controller.visibility.value),
                              child: Icon(
                                !controller.visibility.value ? Icons.visibility : Icons.visibility_off,
                                color: cinzaPadrao,
                              ),
                            ),
                            onFieldSubmitted: (value) async {
                              controller.formLoginKey.currentState!.save();
                              controller.formLoginKey.currentState!.validate();
                              //await controller.validaLogin();
                            },
                            controller: controller.senha,
                            obscureText: !controller.visibility.value,
                            maxLength: 25,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Senha é obrigatório!';
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      SizedBox(
                        width: Get.width / 1.5,
                        height: 40,
                        child: TextButton(
                          onPressed: () async {
                            controller.formLoginKey.currentState!.save();
                            if (controller.formLoginKey.currentState!.validate()) {
                              await controller.efetuaLogin();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(fontColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: backgroundFieldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 82,
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(backgroundFieldColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'lib/app/assets/img/google.png',
                                    width: 31,
                                    height: 33,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Entrar com minha conta Google',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: fontColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      SizedBox(
                        width: Get.width / 2.4,
                        height: 40,
                        child: ButtonComponent(
                          backgroundColor: fontColor,
                          titulo: 'Cadastrar',
                          onPressed: () {
                            Get.toNamed('/cadastro');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 92,
                      ),
                      SizedBox(
                        height: 57,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(backgroundFieldColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'lib/app/assets/img/foguete.png',
                                    width: 48,
                                    height: 48,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Quero ser parceiro',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      color: azulPadrao,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'lib/app/assets/img/prosseguir.png',
                                    width: 32,
                                    height: 34,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
