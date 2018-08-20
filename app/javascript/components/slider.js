function actionSlider(){
  const windSlider = new Slider('#wind-slider', {
  tooltip: 'hide'
  }).on('slide', slideWindAction).on('slideStop', updateSettings);
  const windPrefMin = windSlider._state.value[0];
  const windPrefMax = windSlider._state.value[1];


  const waveSlider = new Slider('#wave-slider', {
  tooltip: 'hide'
  }).on('slide', slideWaveAction).on('slideStop', updateSettings);


  function slideWindAction() {
    document.getElementById("minWindSpan").innerText = windSlider.getValue()[0];
    document.getElementById("maxWindSpan").innerText = windSlider.getValue()[1];
    document.getElementById("user_pref_wind_speed_min").value = windSlider.getValue()[0];
    document.getElementById("user_pref_wind_speed_max").value = windSlider.getValue()[1];

  }
  function slideWaveAction() {
    document.getElementById("minWaveSpan").innerText = waveSlider.getValue()[0];
    document.getElementById("maxWaveSpan").innerText = waveSlider.getValue()[1];
    document.getElementById("user_pref_wave_height_min").value = waveSlider.getValue()[0];
    document.getElementById("user_pref_wave_height_max").value = waveSlider.getValue()[1];
  }


  function updateSettings(){
    console.log("update");
    document.querySelector('#trigger_user_patch').click()
  }
}


export { actionSlider };
