const button = document.querySelector(".main-music .container .buttons #ouvir")
const button2 = document.querySelector(".main-music .container .buttons #parar")
const IniciarMusica = () => {
  const music = document.querySelector('.main-music .container .buttons #ouvir audio')
  music.play();
}

const pararMusica = () => {
  const music = document.querySelector('.main-music .container .buttons #ouvir audio')
  music.pause();
}

button.addEventListener('click', IniciarMusica)
button2.addEventListener('click', pararMusica)