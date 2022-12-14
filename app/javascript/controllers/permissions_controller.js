import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    select_all(){
        var text = this.element.id;
        var myArray = text.split("_");
        var word = myArray[0];
        if (this.element.checked) {
            var checkboxes = document.getElementsByClassName(word);
            for(var i=0, n=checkboxes.length;i<n;i++) {
                checkboxes[i].checked = true;
            }
        } else {
            var checkboxes = document.getElementsByClassName(word);
            for(var i=0, n=checkboxes.length;i<n;i++) {
                checkboxes[i].checked = false;
            }
        }

    }

    deselect_all(){
        var text = this.element.className
        var myArray = text.split(" ");
        var last_index = myArray.length - 1
        var word = myArray[last_index];
        var checkboxes = document.getElementsByClassName(word);
        var check_case = true
        if (this.element.checked == false){
            document.getElementById(word+ '_' + 'all').checked = false;
        }
        for(var i=0, n=checkboxes.length;i<n;i++) {
            if (checkboxes[i].checked){

            }else{
                check_case = false
            }
        }

        if (check_case){
            document.getElementById(word+ '_' + 'all').checked = true;
        }

    }
}