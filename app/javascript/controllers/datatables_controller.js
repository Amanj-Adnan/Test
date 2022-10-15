import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    select(){
       var rows = document.getElementById("attendance_table");

        var selected = [];
        var j = 0
        for (var option of this.element.options)
        {
            if (option.selected) {
                selected.push(option.value);
                // console.log(selected[j])
                if (selected[j] === 'user_id') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }

                    if (selected[j] === "email") {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }
                if (selected[j] === 'date') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }

                if (selected[j] === 'exception') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }
                if (selected[j] === 'clock_in') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }
                if (selected[j] === 'clock_out') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }
                if (selected[j] === 'break_in') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }
                if (selected[j] === 'break_out') {
                    var col =document.getElementsByClassName(selected[j]);
                    for(var i = 0; i < col.length; i++){
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }
                if (selected[j] === 'break_duration') {
                    var col = document.getElementsByClassName(selected[j]);
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.display = "none"; // depending on what you're doing
                    }
                }

                    if (selected[j] === 'comment') {
                        var col = document.getElementsByClassName(selected[j]);
                        for (var i = 0; i < col.length; i++) {
                            // col[i].style.visibility = "hidden"; // or
                            col[i].style.display = "none"; // depending on what you're doing
                        }
                    }


                j++
            }else{
                if (option.value === 'user_id') {
                    var col = document.getElementsByClassName('user_id');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                }
                if (option.value === 'email') {
                    var col = document.getElementsByClassName('email');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                }
                if (option.value === 'date') {
                    var col = document.getElementsByClassName('date');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                }if (option.value === 'exception') {
                    var col = document.getElementsByClassName('exception');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                } if (option.value === 'clock_in') {
                    var col = document.getElementsByClassName('clock_in');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                } if (option.value === 'clock_out') {
                    var col = document.getElementsByClassName('clock_out');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                } if (option.value === 'break_in') {
                    var col = document.getElementsByClassName('break_in');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                } if (option.value === 'break_out') {
                    var col = document.getElementsByClassName('break_out');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                } if (option.value === 'break_duration') {
                    var col = document.getElementsByClassName('break_duration');
                    for (var i = 0; i < col.length; i++) {
                        // col[i].style.visibility = "hidden"; // or
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                } if (option.value === 'comment') {
                    var col = document.getElementsByClassName('comment');
                    for (var i = 0; i < col.length; i++) {
                        col[i].style.removeProperty('display'); // depending on what you'
                    }
                }


            }

        }
        // console.log(selected)
   }
    submit() {
          this.element.requestSubmit()
    }
}