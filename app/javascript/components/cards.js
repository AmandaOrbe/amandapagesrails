function trimText(){
  document.querySelectorAll(".article-description").forEach((description)=>{
   console.log(description);
    const shortText = description.innerText.split(/\s+/).slice(0,15).join(" ") + "...";
    description.innerText = shortText;
  })
  console.log("hello from cards")

};


export { trimText };
