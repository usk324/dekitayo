import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    document.addEventListener('DOMContentLoaded', (event) => {
      const myCarousel = new bootstrap.Carousel(document.getElementById('myCarousel'));
    });
  }
}
