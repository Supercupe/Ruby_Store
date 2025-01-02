import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js";

// Connects to data-controller="stripe-checkout"
export default class extends Controller {
  static values = {url: String}
  async connect() {
    const publicKey = document.head.querySelector("meta[name='stripe-public-key']").content;
    const stripe = Stripe(publicKey)
    const fetchClientSecret = async () => {
      const response = await post(this.urlValue); 
      const { client_secret } = await response.json;
      return client_secret;
    };

    const checkout = await stripe.initEmbeddedCheckout({
      fetchClientSecret,
    });
    checkout.mount(this.element);
  }
}
