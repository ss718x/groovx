import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spotify-player"
export default class extends Controller {
  connect() {
    const token = 'BQC0Ct9g_bLRV6JAUCntVSFScBhgiDZCx7vicwgAr7guDsZnx1oQ9z-Nb4f12DjfPHLuPYm5qiXn1zm3tEK0pUvyvl801XwQ-rDw1y-e9NQf9dGZBhFtTsNli2FDcEeJ4qaKrJDHL7OLhfE2kh6kN9sxHEBJJpF_-5cytGLDth5TXxeO7ZHzfAW4xXyCpRxxFKbkj5JLgCX8';
    const player = new Spotify.Player({
      name: 'Groovx Player',
      getOAuthToken: cb => { cb(token); },
      volume: 0.5
    });

    fetch("/queued_songs")
    .then(response => response.json())
    .then(data => {
      console.log("songs:", data)
      const trackUris = data.map(data => data.uri)
      console.log("trackUris:", trackUris)

      player.addListener('ready', ({ device_id }) => {
        const iframe = document.getElementById('spotify-player')
        let embedcode = `<iframe src="https://open.spotify.com/embed?uri=${trackUris[0]}&device_id=${device_id}&autoplay=1" width="1000" height="200" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>`;

        iframe.innerHTML = embedcode
      })
    })

    player.connect().then(success => {
      if (success) {
        console.log("Spotify player connected")
      }
    })
  }


}
