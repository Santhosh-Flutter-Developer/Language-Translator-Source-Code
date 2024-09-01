// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  var languages =["Hindi", "English","Tamil"];
  var originLanguage ="From";
  var destinationLanguage ="To";
  TextEditingController translatedController = TextEditingController();
  TextEditingController languageController = TextEditingController();

void translate(String src, String dest, String input)async{
  GoogleTranslator translator =  GoogleTranslator();
  var translation = await translator.translate(input,from: src,to: dest);
  setState(() {
    translatedController.text = translation.text.toString();
  });


if(src=='--' || dest=='--'){
  setState(() {
    translatedController.text = "Fail to translate";
  });
}

}

String getLanguageCode (String language){
  switch(language){
case "English":
return "en";
case "Hindi":
return "hi";
case "Tamil":
return "ta";
default:
return "--";
  }
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
      appBar: AppBar(
        backgroundColor:const Color(0xFF8A39EF),
        title:const Text("Language Translator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    DropdownButton(
      focusColor: Colors.white,
      iconDisabledColor: Colors.black,
      iconEnabledColor: Colors.black,
      hint: Text(originLanguage,style:const TextStyle(
      color: Colors.black
      ),),
    dropdownColor: Colors.white,
      icon:const Icon(Icons.keyboard_arrow_down),
      items: languages.map((String dropDownStringItem) {return DropdownMenuItem(value: dropDownStringItem,child: Text(dropDownStringItem),);}).toList(), onChanged: (String? value){
      setState(() {
        originLanguage = value!;
      });
      }),
      const SizedBox(
      width: 40,
      ),
      Icon(Icons.compare_arrows_outlined,color: Colors.black.withOpacity(0.5),size: 30,),
      const SizedBox(
      width: 40,
      ),
      DropdownButton(
      focusColor: Colors.white,
      iconDisabledColor: Colors.black,
      iconEnabledColor: Colors.black,
      hint: Text(destinationLanguage,style:const TextStyle(
      color: Colors.black
      ),),
      dropdownColor: Colors.white,
      icon:const Icon(Icons.keyboard_arrow_down),
      items: languages.map((String dropDownStringItem) {return DropdownMenuItem(value: dropDownStringItem,child: Text(dropDownStringItem),);}).toList(), onChanged: (String? value){
      setState(() {
        destinationLanguage = value!;
      });
      }),
        ],
      ),
    ),
   const SizedBox(
      height: 40,
    ),
    Padding(padding:const EdgeInsets.all(8),child: TextFormField(
    maxLines: 5,
      autofocus: false,
     
      decoration: InputDecoration(
      labelText: "Please Enter Your Text...",
      labelStyle:const TextStyle(
        fontSize: 15,color: Colors.black
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color:Colors.black.withOpacity(0.5),
          width: 0.5
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.5),width: 0.5
        )
      ),
      errorStyle:const TextStyle(
        color: Colors.red,fontSize: 15
      )
      ),
      controller: languageController,
      validator: (value){
      if(value==null || value.isEmpty){
        return "Enter text to translate";
      }
      return null;
      },
    ),),
    Padding(padding:const EdgeInsets.all(8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF8A39EF)
      ),
      onPressed: (){
      translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text.toString());
      }, child:const Text("Translate")),
    ),
   
     Padding(padding:const EdgeInsets.all(8),child: TextFormField(
    maxLines: 5,
      autofocus: false,
     
      decoration: InputDecoration(
      labelText: "Translate pressed ...",
      labelStyle:const TextStyle(
        fontSize: 15,color: Colors.black
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color:Colors.black.withOpacity(0.5),
          width: 0.5
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.5),width: 0.5
        )
      ),
      errorStyle:const TextStyle(
        color: Colors.red,fontSize: 15
      )
      ),
      controller: translatedController,
      validator: (value){
      if(value==null || value.isEmpty){
        return "Please Enter text to translate";
      }
      return null;
      },
    ),),
   
  ],
),
      ),
    );
  }
}