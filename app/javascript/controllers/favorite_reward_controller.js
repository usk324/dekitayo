import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite-reward"
export default class extends Controller {
  connect() {
    console.log("hello");
  }
  favorite() {
    console.log("hi");
  }
}
