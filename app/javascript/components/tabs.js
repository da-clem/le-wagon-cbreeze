function tab_listeners(){
  document.querySelectorAll(".tab").forEach(function(obj) {
    console.log(obj);
    obj.addEventListener("click", addTabListener);
  });
}

function addTabListener(){
  document.querySelector(".active").classList.toggle("active");
  this.classList.toggle("active");

}


export { tab_listeners };



