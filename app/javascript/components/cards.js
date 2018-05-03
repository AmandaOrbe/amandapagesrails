function trimText(){
  document.querySelectorAll(".article-description").forEach((description)=>{
    const fullText = description.innerText.split(/\s+/)
    const shortText = description.innerText.split(/\s+/).slice(0,19).join(" ") + "...";
    if (fullText.length > 20){
      description.innerText = shortText;
    }
  })
  console.log("hello from cards")

};


export { trimText };
