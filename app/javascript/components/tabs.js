/*function tab_listeners(){
  document.querySelectorAll(".tab").forEach(function(obj) {
    obj.addEventListener("click", addTabListener);
  });

  if(isMobile){
    document.querySelectorAll(".timeslottab").forEach(function(obj) {
      obj.addEventListener("click", addTimesListener);
    });
  }
  else{
    console.log("hhhhh");
    document.querySelector(".timeslottab.active").classList.toggle("active");
  }
}

function addTabListener(){
  document.querySelector(".tab.active").classList.toggle("active");
  this.classList.toggle("active");
  if(isMobile){
    if(document.querySelector(".timeslottab.active")!==null)
      document.querySelector(".timeslottab.active").classList.toggle("active");
    document.querySelector(`[data-hour='${selectedHour}']`).classList.toggle("active");
  }
  showCardsForDay(this.getAttribute('data-day'));
}

function addTimesListener(){
  document.querySelector(".timeslottab.active").classList.toggle("active");
  this.classList.toggle("active");
  showCardsForHour(this.getAttribute('data-hour'));
}*/


//export { tab_listeners };



