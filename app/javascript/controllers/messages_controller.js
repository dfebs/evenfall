import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["messages"];
  connect() {
    this.scrollMessagesToBottom()
  
    const targetNode = this.messagesTarget;
    const config = { childList: true };

    const callback = () => {
      this.scrollMessagesToBottom();
    };

    this.observer = new MutationObserver(callback);
    this.observer.observe(targetNode, config);
  }

  disconnect() {
    this.observer.disconnect();
  }

  scrollMessagesToBottom = () => {
    const lastChild = this.messagesTarget.children[this.messagesTarget.children.length - 1]
    if (lastChild) lastChild.scrollIntoView();
  }

  handleFrameLoad = (event) => {
    console.log(event);
  }
}
