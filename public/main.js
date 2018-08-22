

var gif = document.getElementById("homegif");

window.addEventListener("load", function(){
  console.log("this is being loaded");

  gif.classList.remove("hide");


})


window.setTimeout(function(){
  gif.classList.add("hide");
}, 6000)





var fauxDelete = document.getElementById("fake-button");

fauxDelete.onclick = function(){

   modal = document.getElementById("modal");

  modal.style.display = "block";

}

var exit = document.getElementById("exit");

exit.onclick = function(){

modal.style.display = "none";

}
