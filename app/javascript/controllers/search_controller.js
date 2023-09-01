import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["tracks", "form"]

  connect() {
  }

  search(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.tracks) {
          this.tracksTarget.innerHTML = data.tracks
        }
        // this.formTarget.outerHTML = data.form
      })
  }
}
