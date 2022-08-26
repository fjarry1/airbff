import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder' ]
  static values = { price: Number }

  connect() {
  }

  updatePrice() {
    const startDate = this.startDateInputTarget.value
    const endDate = this.endDateInputTarget.value
    const days = this.#diffInDays(startDate, endDate)
    const totalValue = this.#totalValue(days)
    this.#setPriceValue(totalValue)
  }

  #setPriceValue(value) {
    this.priceHolderTarget.innerText = value
  }

  #diffInDays(startDate, endDate) {
    if (startDate && endDate) {
      const diffTime = (Date.parse(endDate) - Date.parse(startDate))
      var days = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    } else {
      var days = 0
    }
    return days + 1
  }

  #totalValue(days) {
    return (days) * this.priceValue
  }
}
