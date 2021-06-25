function GetSelectedTextValue() {

  let GetChoice = document.getElementById("GetChoice");
  let selectedText = GetChoice.options[GetChoice.selectedIndex].innerHTML;
  let selectedValue = GetChoice.value;

  let numberbook = document.getElementsByClassName("genre-select");

  for (let i = 0; i <= numberbook.length - 1; i++) {

    if (document.getElementsByClassName('genre-select')[i].id == selectedValue) {

      let x = document.getElementsByClassName('genre-select')[i];
      x.style.display = "block";
    } else if (document.getElementsByClassName('genre-select')[i].id != selectedValue) {

      let y = document.getElementsByClassName('genre-select')[i];
      y.style.display = "none";
    }
  }
}