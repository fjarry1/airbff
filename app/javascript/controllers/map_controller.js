import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
/*
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      console.log(marker.specialty_id)
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker({
        color: "#FFFFFF",
        draggable: true,
        id: "SOMEID",
        dataId: "ID"
        })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  } */

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      console.log(marker.specialty_id)
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const el = document.createElement('div');
      el.className = 'marker';
      el.innerHTML = '<i class="fa-solid fa-location-dot"></i>';
      el.dataset.specialtyId = marker.specialty_id
      el.id = `specialty-marker-${marker.specialty_id}`
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    // this.markersValue.forEach(marker => console.log(marker))

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
