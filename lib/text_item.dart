import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:template_binding/template_binding.dart';


@CustomTag('text-item')
 class TextItem extends LIElement with Polymer, Observable {
    
   TextItem.created() : super.created(){
   polymerCreated();
   
   }
   
   void ready(){
      super.ready();
   }
    
  }