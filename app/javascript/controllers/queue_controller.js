import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="queue"
export default class extends Controller {
  connect() {
    console.log('connected!')
  }

  addToQueue(event) {
    console.log("event:", event.currentTarget)
    const trackId = event.currentTarget.getAttribute("data-track-id");
    console.log("trackId:", trackId)

    fetch(`/tracks/add_track_to_queue?track_id=${trackId}`, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    }).then(response => {
      if (response.ok) {
        console.log("response:", response)

        // const trackId = event.currentTarget.getAttribute("data-track-id");
        // console.log('Track ID:', trackId);

        // const queueContainer = document.querySelector('#queue');
        // console.log(queueContainer);
        // const newTrackHtml = `
        //   <div class="track">
        //     <iframe class="spotify-player" src="https://open.spotify.com/embed/track/${trackId}" width="300" height="80" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
        //   </div>
        // `;
        // queueContainer.insertAdjacentHTML('beforeend', newTrackHtml);
      } else {
        console.error(error)
      }
    })
  }
}




// // app/javascript/controllers/queue_controller.js

// import { Controller } from "stimulus"

// export default class extends Controller {
//   static targets = ["list"]

//   initialize() {
//     this.queuedSongs = [];
//   }

//   addSongToQueue(trackId, roomId) {
//     fetch("/tracks/add_track_to_queue", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         "X-CSRF-Token": this.getMetaValue("csrf-token")
//       },
//       body: JSON.stringify({ track_id: trackId, roomId: roomId })
//     })
//     .then(response => response.json())
//     .then(data => {
//       this.queuedSongs = data.queued_songs;
//       this.updateQueueList();
//     });
//   }

//   updateQueueList() {
//     const list = this.listTarget;
//     list.innerHTML = "";  // clear the existing list
//     this.queuedSongs.forEach((song, index) => {
//       const listItem = document.createElement("li");
//       listItem.textContent = `Track ID: ${song.track_id}, Room ID: ${song.room_id}`;
//       list.appendChild(listItem);
//     });
//   }

//   getMetaValue(name) {
//     const element = document.head.querySelector(`meta[name="${name}"]`);
//     return element.getAttribute("content");
//   }
// }
