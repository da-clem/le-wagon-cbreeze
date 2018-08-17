function actionSwitch(){
  document.querySelectorAll(".toggle-input").forEach(function(obj) {
    obj.addEventListener("click", toggleEvent);
  });

}

function toggleEvent(){
  console.log(this.hasAttribute("checked"));
  if(this.hasAttribute("checked"))
    this.parentNode.querySelector('.removeSession').click();
  else
    this.parentNode.querySelector('.addSession').click()
}

export { actionSwitch };
