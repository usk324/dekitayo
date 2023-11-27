import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-reward"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
  purchase(event) {
    console.log("hello");
  }
}
