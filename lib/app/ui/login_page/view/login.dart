import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/login_page/controller/login_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

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
                        height: 40,
                        width: Get.width / 1.5,
                        child: TextFormField(
                          controller: controller.email,
                          autofocus: true,
                          maxLength: 50,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: backgroundFieldColor,
                            filled: true,
                            counterText: '',
                            contentPadding: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              color: cinzaPadrao,
                            ),
                            suffix: const SizedBox(),
                          ),
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(controller.nextFocus);
                          },
                          cursorColor: fontColor,
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Obx(
                        () => SizedBox(
                          height: 40,
                          width: Get.width / 1.5,
                          child: TextFormField(
                            controller: controller.senha,
                            focusNode: controller.nextFocus,
                            obscureText: !controller.visibility.value,
                            maxLength: 25,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: backgroundFieldColor,
                              filled: true,
                              counterText: '',
                              contentPadding: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
                              hintText: 'Senha',
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                color: cinzaPadrao,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => controller.visibility(!controller.visibility.value),
                                child: Icon(
                                  !controller.visibility.value ? Icons.visibility : Icons.visibility_off,
                                  color: cinzaPadrao,
                                ),
                              ),
                            ),
                            cursorColor: fontColor,
                            onFieldSubmitted: (value) async {
                              controller.formLoginKey.currentState!.save();
                              await controller.validaLogin();
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
                            await controller.validaLogin();
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
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(fontColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          child: Text(
                            'Cadastrar',
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
