window.addEventListener('load', function(){
  const cards = document.querySelectorAll(".card-shadow");
  cards.forEach(function(card) {
    card.addEventListener('mouseover', function() {
      this.setAttribute("style", "box-shadow: 5px 10px 25px 0 rgba(0, 0, 0, 0.3);");
    });
    card.addEventListener('mouseout', function() {
      this.removeAttribute("style", "box-shadow: 5px 10px 25px 0 rgba(0, 0, 0, 0.3);");
    });
  });
});