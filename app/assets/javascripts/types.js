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