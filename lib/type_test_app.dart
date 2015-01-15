import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('type-test')
class TypeTest extends PolymerElement{
  
  TypeTest.created() : super.created();
  
  int charCounter = 0;
 
  
  @observable String words = "0";
  @observable String timer = "00.00";
  @observable String rate = "0";
  @observable String acc = "0";
  @observable String lasttime = "0";
  @observable String lastacc = "0";
  @observable String besttime = "0";
  @observable String bestacc = "0";
  @observable bool smallScreen = true;
  
  ContentElement content;
  ButtonElement resetButton;
  var grossCheck;
  var netCheck;
  TextAreaElement typeArea;
  Stream typeStream;
  List<String> contentWords;
  List<String> charCodeList;
  
  Stopwatch mywatch = new Stopwatch();
  Timer myTimer;
  

    
  void pressStart(Event e){
    timer = "00.00";
    mywatch.start();
    var oneSecond = new Duration(seconds:1);
    myTimer = new Timer.periodic(oneSecond, updateTime);
    charCodeList = new List<String>();
    typeStream.firstWhere((e) => e.keyCode == KeyCode.ENTER).then(stopping);
  }
  
  void stopping(Event e){
    double time = (mywatch.elapsedMilliseconds / 1000) / 60;
    mywatch.stop();
    myTimer.cancel();
              
    List<String> typedWords = typeArea.value.toString().split(' ');
    
    int expectedWordCount = contentWords.length;
    int correctWords = 0;
    
    for(int i = 0; i < typedWords.length; i++){
      if(contentWords[i].toLowerCase() == typedWords[i].toLowerCase()){
        correctWords++;
      }
    }

    double percentageCorrect = (correctWords / expectedWordCount) * 100;
    acc = percentageCorrect.toStringAsFixed(2);
    lastacc = acc;
    
    //This part is needed due to keycodes for space and backspace not working correctly. 
    //
    int correctCharCount = 0;
    for(int i = 0; i < charCodeList.length; i++){
      if(charCodeList[i] != "32" && charCodeList[i] != "8"){
        correctCharCount++;
      }
    }
    charCounter = correctCharCount;

            
    if(netCheck.checked == true){
      int uncorrectErrors = expectedWordCount - correctWords;
      double avgWordAcc = (charCounter / 5) - uncorrectErrors;
      double grossWPM = avgWordAcc / time;
      rate = grossWPM.toStringAsFixed(2);
    }
    
    lasttime = rate; 
    setbestwpm();
    setbestacc();
      
    mywatch.reset();
    charCounter = 0;
    acc = "0";
    words = '0';
    rate = "0";
    typeStream.first.then(pressStart);

  }
  
  void setbestwpm(){
    double rated = double.parse(lasttime);
    double best = double.parse(besttime);
    if( rated > best ){
      besttime = rated.toString();
    }
  }
  
  void setbestacc(){
    double lastaccu = double.parse(lastacc);
    double bestaccu = double.parse(bestacc);
    if(lastaccu > bestaccu){
       bestacc = lastacc;
    }
  }
  

  
  void typeEvent(int code){
    charCodeList.add(code.toString());
    if(code == 8){
      charCounter--;
    } else if(code == KeyCode.SPACE || code == KeyCode.ENTER){
      acc = 'b';
    } else {
      acc = code.toString();
      charCounter++;
    }
    updateStats();
    //acc = code.toString();
  }
  
  void updateStats(){
    double avgWord = charCounter / 5;
    words = avgWord.toStringAsFixed(2);
    double time = (mywatch.elapsedMilliseconds / 1000) / 60;
    double grossWPM = avgWord / time;   
    rate = grossWPM.toStringAsFixed(2);
  }
  

  void toggleDialog(e){
    if (e.target.localName != 'paper-button') {
          return;
        }
        var d = e.target.querySelector('paper-dialog');
        if (d == null) return;
        d.toggle();
  }
  
  
  
  void updateTime(Timer _){
        var s = mywatch.elapsedMilliseconds~/1000;
        var m = 0;
                
        // The operator ~/ divides and returns an integer.
        if (s >= 60) { m = s ~/ 60; s = s % 60; }
          
        String minute = (m <= 9) ? '0$m' : '$m';
        String second = (s <= 9) ? '0$s' : '$s';
        timer = '$minute:$second';
  }
  
  @override
  void attached() {
    super.attached();
    
    content = $['typeTemplate'];
    contentWords = content.getDistributedNodes().first.text.toLowerCase().split(' ');
    resetButton = $['resetButton'];
    typeArea = $['typearea']; 
    grossCheck = $['grosswpm'];
    netCheck = $['netwpm'];
    
    typeStream = typeArea.onKeyPress.asBroadcastStream();
    typeStream.first.then(pressStart);
    typeStream.forEach((e) => typeEvent(e.keyCode) );

  }
  
  @override
  void detached() {
    super.detached();
  }
  
  void resetTypeBox(){
    typeArea.value = ""; 
  }
  
  
}