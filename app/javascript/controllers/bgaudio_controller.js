import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bgaudio"
export default class extends Controller {
  static values = {
    src: String
  }
  connect() {
    console.log(this.srcValue)
    this.audio = new Audio(this.srcValue);
  }

  // disconnect() {
  //   this.audio.pause();
  // }

  play() {
    if (this.audio.duration > 0 && !this.audio.paused) {
      this.audio.pause();
    } else {
      this.audio.play();
    }
  }
}
