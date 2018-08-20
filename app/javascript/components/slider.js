function actionSlider(){
  console.log("hey");
  const windSlider = new Slider('#wind-slider', {
  tooltip: 'hide'
  }).on('slide', slideWindAction);
  const windPrefMin = windSlider._state.value[0];
  const windPrefMax = windSlider._state.value[1];


  const waveSlider = new Slider('#wave-slider', {
  tooltip: 'hide'
  }).on('slide', slideWaveAction);


  function slideWindAction() {
    document.getElementById("minWindSpan").innerText = windSlider.getValue()[0];
    document.getElementById("maxWindSpan").innerText = windSlider.getValue()[1];
  }
  function slideWaveAction() {
    document.getElementById("minWaveSpan").innerText = waveSlider.getValue()[0];
    document.getElementById("maxWaveSpan").innerText = waveSlider.getValue()[1];
  }
}


export { actionSlider };
