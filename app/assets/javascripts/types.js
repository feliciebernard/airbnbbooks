function GetSelectedTextValue() {

  let GetChoice = document.getElementById("GetChoice");
  let selectedText = GetChoice.options[GetChoice.selectedIndex].innerHTML;
  let selectedValue = GetChoice.value;

  var all = "Trier par style de lecture";

  let numberbook = document.getElementsByClassName("genre-select");


  if (selectedValue.includes(all)){

  for (let i = 0; i <= numberbook.length - 1; i++) {

    let x = document.getElementsByClassName('genre-select')[i]
    x.style.display = "block";
    }
      return;
  }


  for (let i = 0; i <= numberbook.length - 1; i++) {

    if (document.getElementsByClassName('genre-select')[i].id == selectedValue) {

      let y = document.getElementsByClassName('genre-select')[i];
      y.style.display = "block";
    } 


    else if (document.getElementsByClassName('genre-select')[i].id != selectedValue) {

      let z = document.getElementsByClassName('genre-select')[i];
      z.style.display = "none";
    }
  }
}

function OpenModal() {

let buttons = document.getElementsByClassName("btntrig");
let modals = document.getElementsByClassName("modal");
let closes = document.getElementsByClassName("close");


let numberbook = document.getElementsByClassName("genre-select");

for (let t = 0; t <= numberbook.length - 1; t++) {

  let button = buttons[t];
  let modal = modals[t];
  let close = closes[t];

  

  button.onclick = function() {
    
    modals[this.id].style.display = "block";
  }

  close.onclick = function() {
    modals[this.id].style.display = "none";
  }


  }
}
