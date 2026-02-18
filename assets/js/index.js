document.addEventListener('DOMContentLoaded', () => {
  const button = document.querySelector('.main-music .container .buttons #ouvir')
  const button2 = document.querySelector('.main-music .container .buttons #parar')
  const audio = document.querySelector('.main-music .container .buttons #ouvir audio')

  const IniciarMusica = () => { if (audio) audio.play(); }
  const pararMusica = () => { if (audio) audio.pause(); }

  if (button) button.addEventListener('click', IniciarMusica)
  if (button2) button2.addEventListener('click', pararMusica)
})