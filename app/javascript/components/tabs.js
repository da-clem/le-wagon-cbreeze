function tab_listeners(){
  document.querySelectorAll(".tab").forEach(function(obj) {
    obj.addEventListener("click", addTabListener);
  });
}

function addTabListener(){
  document.querySelector(".active").classList.toggle("active");
  this.classList.toggle("active");
  console.log(this.getAttribute('data-day'))
}


export { tab_listeners };



