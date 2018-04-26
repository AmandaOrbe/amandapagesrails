const URL = window.location.href
function greetings(event){
  console.log(event);
}


function underlineCurrent(){
  if (URL.includes("pages")){
    document.querySelector("#pages-nav > .underline").style.width = "100%";
    document.querySelector("#pages-nav h3").style.fontSize = "36px";
  } else if (URL.includes("articles")){
    document.querySelector("#articles-nav > .underline").style.width = "100%";
    document.querySelector("#articles-nav h3").style.fontSize = "36px";
  }else if (URL.includes("ressources")){
    document.querySelector("#ressources-nav > .underline").style.width = "100%";
    document.querySelector("#ressources-nav h3").style.fontSize = "36px";
  } else {
    document.querySelector("#articles-nav > .underline").style.width = "100%";
    document.querySelector("#articles-nav  h3").style.fontSize = "36px";

  }

};


export { underlineCurrent };



