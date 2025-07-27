// app/javascript/controllers/message_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textBox", "submitButton"]

  connect() {
    console.log("MessageFormController connected");
    this.isShiftHeld = false;

    window.addEventListener("keydown", this.handleShiftDown);
    window.addEventListener("keyup", this.handleShiftUp);

    this.textBoxTarget.addEventListener("keydown", this.handleKeyDown.bind(this));
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

  handleKeyDown(event) {
    if (event.key === "Enter" && !this.isShiftHeld) {
      event.preventDefault();
      this.submitButtonTarget.click();
    }
  }
}
