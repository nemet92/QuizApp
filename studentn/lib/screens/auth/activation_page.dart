import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:studentn/widgets/custom_%20button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../models/register_device_request_model.dart';
import '../../utils/appsize/appsize.dart';
import '../../utils/network_util/network.dart';
import '../../utils/themes/theme.dart';
import '../home_view.dart';
import '../../widgets/custom_textfiled_widget.dart';

class ActivationPage extends StatefulWidget {
  const ActivationPage({Key? key}) : super(key: key);

  @override
  State<ActivationPage> createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  TextEditingController finCodeEditingController = TextEditingController();
  bool _valitadeFinCode = false;
  bool isLoading = false;
  bool remember = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      width: (MediaQuery.of(context).size.width < 50)
                          ? AppSize.calculateWidth(context, 400)
                          : AppSize.calculateWidth(context, 250),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Themes.primaryColor.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 30),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Xoş Gəlmişiniz',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Themes.primaryTextcolor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: CustomTextFieldWidget(
                              textEditingController: finCodeEditingController,
                              validate: _valitadeFinCode,
                              maxLength: 7,
                              labelText: 'Fin kod',
                              errorText:
                                  (finCodeEditingController.text.isEmpty == true)
                                      ? "Bu xana boş qala bilməz"
                                      : "Fin kod 7 simvol olmalıdı"),
                        ),
                        (isLoading == false)
                            ? SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width *
                                  (0.40),
                              child: CustomButtonWidget(
                                buttonText: 'Aktivləşdir',
                                textColor: Colors.white,
                                textFontSize: 20,
                                buttonBorderRadius: 10,
                                buttonBackgroundColor: Themes.primaryColor,
                                buttonSideColor: Themes.primaryColor,
                                onPressed: () {
                                  setState(() {
                                    (finCodeEditingController
                                                .text.isEmpty ||
                                            finCodeEditingController
                                                    .text.length !=
                                                7)
                                        ? _valitadeFinCode = true
                                        : _valitadeFinCode = false;
                                    if (_valitadeFinCode == false) {
                                      loginUser();
                                    }
                                  });
                                },
                              ),
                            )
                            : const CircularProgressIndicator(
                                color: Themes.primaryColor),SizedBox(height: 40,)
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDeviceId() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return deviceId;
  }

  getDeviceType() {
    if (Platform.isAndroid || Platform.isIOS) {
      return 'mobile';
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return 'pc';
    }
  }

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    RegisterDeviceRequestModel registerDeviceRequestModel =
        RegisterDeviceRequestModel(
            key: getDeviceId().toString(),
            keyType: getDeviceType().toString(),
            finNumber: finCodeEditingController.text);
    var response = await WebService.registerDevice(
      registerDeviceRequestModel,
    );
    if (response == true) {
      setState(() {
        isLoading = false;
      });
      showTopSnackBar(
          context, const CustomSnackBar.success(message: 'Giriş uğurludur'));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      setState(() {
        isLoading = false;
      });
      showTopSnackBar(
          context, const CustomSnackBar.error(message: 'Xəta baş verdi'));
    }
  }
}
