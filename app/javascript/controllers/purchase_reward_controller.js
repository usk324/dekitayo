import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-reward"
export default class extends Controller {
  static values = {
    src: String,
    play: Boolean
  }

  connect() {
    // console.log(this.playValue);
    // console.log(this.playValue.getClass());
    if (this.playValue === true) {
      // console.log("It should be playing");
      const soundPath = this.srcValue;
      // console.log('Sound Path:', soundPath);

      if (!soundPath) {
          console.error('Audio file path is not available.');
          return;
      }

      const audio = new Audio(soundPath);
      audio.play();
    }
  }

  // play() {
  //   const soundPath = this.srcValue;
  //   console.log('Sound Path:', soundPath);

  //   if (!soundPath) {
  //       console.error('Audio file path is not available.');
  //       return;
  //   }

  //   const audio = new Audio(soundPath);
  //   audio.play();
  // }
}
