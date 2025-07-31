// app/javascript/controllers/message_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textBox", "submitButton"]

  connect() {
    this.isShiftHeld = false;

    window.addEventListener("keydown", this.handleShiftDown);
    window.addEventListener("keyup", this.handleShiftUp);

    this.textBoxTarget.addEventListener("keydown", this.handleKeyDown);
  }

  disconnect() {
    window.removeEventListener("keydown", this.handleShiftDown);
    window.removeEventListener("keyup", this.handleShiftUp);
  }

  handleShiftDown = (event) => {
    if (event.key === "Shift") this.isShiftHeld = true;
  }

  handleShiftUp = (event) => {
    if (event.key === "Shift") this.isShiftHeld = false;
  }

  handleKeyDown = (event) => {
    if (event.key === "Enter" && !this.isShiftHeld && !this.isMobile()) {
      event.preventDefault();
      this.submitButtonTarget.click();
    }
  }

  isMobile = function() {
  if(window.matchMedia("(any-hover:none)").matches) {
    return true;
  } else {
    return false;
  }
};
}
