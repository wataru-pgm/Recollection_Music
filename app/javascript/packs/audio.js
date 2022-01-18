const audioVol = () => {
  const audios = document.getElementsByClassName('vols');
  for( let i = 0; i < audios.length; i++ ){
    audios[i].volume = 0.2;
  }
}
window.addEventListener('DOMContentLoaded' , function(){
  audioVol();
}, false);