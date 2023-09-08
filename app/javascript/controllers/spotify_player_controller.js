import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spotify-player"
export default class extends Controller {
  connect() {
    const token = 'BQBPtsyi7XLbzGli5wtPqhzcUwG4q75SPDtOD6wzjuOg-xMu5V4Gg9nv7hTerypX4JfMJ0tfzyX69VG5yQmGTfkd-K39xN4QpfGOhFITU8MLctpVIXFzY2skeVtaG9mgWUSWbOQQOEfWhIXuRrwsTVQVeJecxqEETC2pvaV80ceD5ZE08PMQHvVo_ol-NCvqSagCv6QrxTdT';
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
