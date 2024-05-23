import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  var language = [
    'Hindi',
    'English',
    'Marathi',
    'Spanish',
    'Japanese',
    'French',
    'Urdu',
    'Greek',
    'Latin'
  ];
  var originLanguage = 'From';
  var destinationLanguage = 'To';
  var output = '';
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Fail to Translate';
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == 'English') {
      return 'en';
    } else if (language == 'Hindi') {
      return 'hi';
    } else if (language == 'Marathi') {
      return 'mr';
    } else if (language == 'Spanish') {
      return 'es';
    } else if (language == 'French') {
      return 'fr';
    } else if (language == 'Urdu') {
      return 'ur';
    } else if (language == 'Latin') {
      return 'la';
    } else if (language == 'Greek') {
      return 'el';
    } else if (language == 'Japanese') {
      return 'ja';
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7dd0fa),
      appBar: AppBar(
        title: const Text(
          'LANGUAGE  TRANSLATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff10223d),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      focusColor: Colors.transparent,
                      iconDisabledColor: Colors.transparent,
                      iconEnabledColor: Colors.transparent,
                      hint: Text(
                        originLanguage,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      dropdownColor: const Color(0xff10223d),
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      ),
                      items: language.map((String dropDownStringItem) {
                        return DropdownMenuItem(
                            value: dropDownStringItem,
                            child: Text(
                              dropDownStringItem,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          originLanguage = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    DropdownButton(
                      focusColor: Colors.transparent,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(
                        destinationLanguage,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      dropdownColor: const Color(0xff10223d),
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      items: language.map((String dropDownStringItem) {
                        return DropdownMenuItem(
                            value: dropDownStringItem,
                            child: Text(
                              dropDownStringItem,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          destinationLanguage = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: null,
                  //keyboardType: TextInputType.multiline,

                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Enter Your Text',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      )),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      )),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff10223d)),
                    onPressed: () {
                      translate(
                          getLanguageCode(originLanguage),
                          getLanguageCode(destinationLanguage),
                          languageController.text.toString());
                    },
                    child: const Text(
                      'Translate',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '\n$output',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
