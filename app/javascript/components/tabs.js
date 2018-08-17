function tab_listeners(){
  document.querySelectorAll(".tab").forEach(function(obj) {
    obj.addEventListener("click", addTabListener);
  });

  document.querySelectorAll(".timeslottab").forEach(function(obj) {
    obj.addEventListener("click", addTimesListener);
  });
}

function addTabListener(){
  document.querySelector(".tab.active").classList.toggle("active");
  this.classList.toggle("active");
  document.querySelector(".timeslottab.active").classList.toggle("active");
  document.querySelector("[data-hour='11']").classList.toggle("active");
  showCardsForDay(this.getAttribute('data-day'));
}

function addTimesListener(){
  document.querySelector(".timeslottab.active").classList.toggle("active");
  this.classList.toggle("active");
  showCardsForHour(this.getAttribute('data-hour'));
}


export { tab_listeners };



