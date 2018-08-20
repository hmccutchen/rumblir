

var gif = document.getElementById("homegif");

window.addEventListener("load", function(){
console.log("this is being loaded");

   gif.classList.remove("hide");


})


window.setTimeout(function(){
  gif.classList.add("hide");
}, 6000)




