import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inline-marker"
export default class extends Controller {
  static targets = ["target"]
  connect() {
    console.log("connected");
  }

  updateMarker(event) {
    const specialtyId = event.currentTarget.dataset.specialtyId
    const marker = document.getElementById(`specialty-marker-${specialtyId}`)
    console.log(marker)
    marker.classList.add('active')
    event.currentTarget.classList.add('active')
    console.log(marker)
  }

  redToBlack(event) {
    const specialtyId = event.currentTarget.dataset.specialtyId
    const marker = document.getElementById(`specialty-marker-${specialtyId}`)
    marker.classList.remove('active')
    event.currentTarget.classList.remove('active')
  }
}
