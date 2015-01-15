import 'package:polymer/polymer.dart';
import 'package:template_binding/template_binding.dart';


main() => initPolymer();

class TextField {
  final String name;
  final String content;
  final int id;
  int length;

  
  TextField(this.name, this.content,this.id){
    this.length = content.length;
  }
}
  
 @CustomTag('text-select-menu')
 class TextSelectMenu extends PolymerElement {
   
   @observable ObservableList<TextField> items; 
   @observable int page = 0;
   @observable int page1 = 0;
   @observable var selectedAlbum;
   
 
   TextSelectMenu.created() : super.created();
   
   void ready(){
     items = new ObservableList<TextField>();
     items.add(new TextField('Lorem ipsum', """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
            dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
            sunt in culpa qui officia deserunt mollit anim id est laborum." Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium 
            doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 
            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem 
            sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi 
            tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis 
            suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil 
            molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?""", items.length));
     items.add(new TextField('Two', 'Content', items.length));
     items.add(new TextField('Three', 'Content', items.length));
     items.add(new TextField('Four', 'Content', items.length));
     items.add(new TextField('Five', 'Content', items.length));
     items.add(new TextField('Six', 'Content', items.length));
     items.add(new TextField('Seven', 'Content', items.length));
     items.add(new TextField('Eight', 'Content', items.length));
     items.add(new TextField('Nine', 'Content', items.length));
     items.add(new TextField('Ten', 'Content', items.length));
     items.add(new TextField('Eleven', 'Content', items.length));
     items.add(new TextField('Twelve', 'Content', items.length));
     items.add(new TextField('Thirteen', 'Content', items.length));
     items.add(new TextField('Fourteen', 'Content', items.length));
     items.add(new TextField('Fifthteen', 'Content', items.length));
     items.add(new TextField('Sixteen', 'Content', items.length));
     items.add(new TextField('Seventeen', 'Content', items.length));
   }
   
   transition(e) {
         if (this.page == 0) {
           this.selectedAlbum = nodeBind(e.target).templateInstance
             .model['item'];
           this.page = 1;
         } else {
           this.page = 0;
         }
       }
   transition1(e) {
         if (this.page1 == 2) {
           this.page1 = 0;
         } else {
           this.page1 += 1;
         }
       }
   
    
  }