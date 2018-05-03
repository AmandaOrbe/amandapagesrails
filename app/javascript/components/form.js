const categoryCards = document.querySelectorAll(".category-frame")
const radioButtons = document.querySelectorAll(".rb")
// const categoryButtons = document.querySelectorAll(".category-buttons")
function findCard (element) {
    while ((element = element.parentElement) && !element.classList.contains("category-frame"));
    return element;
}



function uncheckOthers(){
  const selectedCard = document.querySelector(".selected");
  if (selectedCard){
  selectedCard.classList.remove("selected");
  };
}


function clickCard(){
  categoryCards.forEach((category) => {
    category.addEventListener("click", (event) => {
      const card = findCard(event.target)
      const button = card.querySelector(".rb")
      button.checked = true;
      uncheckOthers();
      if(button.checked){
        card.classList.add("selected");
      }else{
        card.classList.remove("selected");
      }

    });
  })
}



export { clickCard };
export { checkedRadio };
