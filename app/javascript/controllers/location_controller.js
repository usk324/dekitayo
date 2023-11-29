import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  static targets = ['completed_latitude', 'completed_longitude']

  connect() {
    // console.log("connected");
    // console.log(navigator.geolocation);
    // if (navigator.geolocation) {
    //   console.log("are we here?");
    //   navigator.geolocation.getCurrentPosition((position) => {
    //       console.log(position.coords)
    //       this.completed_latitudeTarget.value = position.coords.latitude
    //       this.completed_longitudeTarget.value = position.coords.longitude
    //     });
    // }
  }

  getGeolocation(e) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
          this.completed_latitudeTarget.value = position.coords.latitude
          this.completed_longitudeTarget.value = position.coords.longitude
          console.log("Got Geolocation")
        });
    }
  }
}
