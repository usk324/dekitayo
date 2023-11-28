import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="snow"
export default class extends Controller {
  connect() {
    //get the canvas and conext and store in vars
    const snowflakesContainer = this.element;

    for (let i = 0; i < 50; i++) {
      const snowflake = document.createElement("div");
      snowflake.className = "snowflake";
      snowflake.style.left = `${Math.random() * 100}%`;
      snowflake.style.animationDuration = `${Math.random() * 3 + 2}s`;
      snowflake.style.animationDelay = `${Math.random()}s`;
      snowflakesContainer.appendChild(snowflake);
    }
  }
}
