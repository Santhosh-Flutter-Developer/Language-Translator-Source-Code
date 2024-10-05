// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  var languages =["Hindi", "English","Tamil","Spanish","French","German","Chinese","Japanese","Korean","Russian","Arabic","Portuguese","Bengali","Urdu","Italian","Turkish","Vietnamese","Thai","Indonesian","Malay","Greek","Dutch","Swedish","Polish","Persian","Hebrew","Romanian","Czech","Danish","Finnish","Norwegian","Hungarian","Slovak"];
  var originLanguage ="English";
  var destinationLanguage ="Tamil";
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
  case "Spanish":
    return "es";
  case "French":
    return "fr";
  case "German":
    return "de";
  case "Chinese":
    return "zh";
  case "Japanese":
    return "ja";
  case "Korean":
    return "ko";
  case "Russian":
    return "ru";
  case "Arabic":
    return "ar";
  case "Portuguese":
    return "pt";
  case "Bengali":
    return "bn";
  case "Urdu":
    return "ur";
  case "Italian":
    return "it";
  case "Turkish":
    return "tr";
  case "Vietnamese":
    return "vi";
  case "Thai":
    return "th";
  case "Indonesian":
    return "id";
  case "Malay":
    return "ms";
  case "Greek":
    return "el";
  case "Dutch":
    return "nl";
  case "Swedish":
    return "sv";
  case "Polish":
    return "pl";
  case "Persian":
    return "fa";
  case "Hebrew":
    return "he";
  case "Romanian":
    return "ro";
  case "Czech":
    return "cs";
  case "Danish":
    return "da";
  case "Finnish":
    return "fi";
  case "Norwegian":
    return "no";
  case "Hungarian":
    return "hu";
  case "Slovak":
    return "sk";
  default:
    return "--";
}

}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
      appBar: AppBar(
        backgroundColor:const Color(0xFF8A39EF),
        title:const Text("Language Translator",style: TextStyle(
          color: Colors.white
        ),),
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
      value: originLanguage,
      menuMaxHeight: 200,
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
      InkWell(
        onTap: (){
          setState(() {
          String temp1=originLanguage;
          String temp2=destinationLanguage;
          originLanguage=temp2;
          destinationLanguage=temp1;
        
          });
        },
        child: Icon(Icons.compare_arrows_outlined,color: Colors.black.withOpacity(0.5),size: 30,)),
      const SizedBox(
      width: 40,
      ),
      DropdownButton(
      focusColor: Colors.white,
      value: destinationLanguage,
       menuMaxHeight: 200,
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
    maxLines: 7,
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
      }, child:const Text("Translate",style: TextStyle(color: Colors.white),)),
    ),
   
     Padding(padding:const EdgeInsets.all(8),child: TextFormField(
    maxLines: 7,
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