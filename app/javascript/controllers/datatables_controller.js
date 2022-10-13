import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    select(){
       var rows = document.getElementById("attendance_table");

        var selected = [];
        var i = 0
        for (var option of this.element.options)
        {
            if (option.selected) {
                selected.push(option.value);
                // console.log(selected[i])
                if (selected[i] === 'user_id') {
                    var col =document.getElementsByClassName(selected[i]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                } else {
                    console.log('amanj')
                    var col =document.getElementsByClassName(selected[i]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty( 'display' ); // depending on what you're doing
                    }
                }

                i++
            }else{
                if (option.value === 'user_id') {
                    var col = document.getElementsByClassName('user_id');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                }
            }
        }
        console.log(selected)
   }
    submit() {
          this.element.requestSubmit()
    }
}