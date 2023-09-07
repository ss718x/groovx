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
        console.log("data:", data)
        // this.formTarget.outerHTML = data.form
      })
  }


}

// tabs
const tabs = document.querySelectorAll('[data-tab-target]')
const tabContents = document.querySelectorAll('[data-tab-content]')

tabs.forEach(tab => {
  tab.addEventListener('click', () => {
    const target = document.querySelector(tab.dataset.tabTarget)
    tabContents.forEach(tabContent => {
      tabContent.classList.remove('active')
    })
    tabs.forEach(tabContent => {
      tabContent.classList.remove('active')
    })
    tab.classList.add('active')
    target.classList.add('active')
  })
})
