// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

const element = document.querySelector("trix-editor")
// TODO make the #messages selector scroll down when something is added to it, or when form is submitted
let isShiftHeld = false;

window.addEventListener ("keydown", event => {
  if (event.key === "Shift") isShiftHeld = true;
});

window.addEventListener ("keyup", event => {
  if (event.key === "Shift") isShiftHeld = false;
});

element.addEventListener("keydown", event => {
  if (event.key == "Enter" && !isShiftHeld) {
    event.preventDefault();
    element.inputElement.form.submit();
  }
});
