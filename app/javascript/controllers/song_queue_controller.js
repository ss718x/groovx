import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log('are we connected?')
  }

  addToQueue(event) {
    const trackId = event.currentTarget.getAttribute("data-track-id");
    console.log(trackId)

    fetch(`/add_track_to_queue?track_id=${trackId}`, {
      method: "POST",
    })
    .then(response => {
      if (response.ok) {
        const trackId = event.currentTarget.getAttribute("data-track-id");
        console.log('Track ID:', trackId);

        const queueContainer = document.querySelector('#queue');
        console.log(queueContainer);
        const newTrackHtml = `
          <div class="track">
            <iframe class="spotify-player" src="https://open.spotify.com/embed/track/${trackId}" width="300" height="80" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
          </div>
        `;
        queueContainer.insertAdjacentHTML('beforeend', newTrackHtml);
      } else {
        console.log("blah blah didn't work");
      }
    })
    .catch(error => {
      console.error("Error:", error);
    });
  }
}
