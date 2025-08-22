import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["typeSelect", "dogWrapper", "catWrapper", "turtleWrapper"]
  connect() {
    this.update() // déclenché au chargement de la page
  }
  update() {
    const type = this.typeSelectTarget.value
    if (type === "dog") {
      // Affiche chiens
      this.dogWrapperTarget.classList.remove("hidden")
      this.catWrapperTarget.classList.add("hidden")
      this.turtleWrapperTarget.classList.add("hidden")

      // Active le select chien
      this.dogWrapperTarget.querySelector("select").removeAttribute("disabled")

      // Désactive et vide le select chat
      this.catWrapperTarget.querySelector("select").setAttribute("disabled", "disabled")
      this.catWrapperTarget.querySelector("select").value = ""
      this.turtleWrapperTarget.querySelector("select").setAttribute("disabled", "disabled")
      this.turtleWrapperTarget.querySelector("select").value = ""

    } else if (type === "cat") {

      // Affiche chats
      this.catWrapperTarget.classList.remove("hidden")
      this.dogWrapperTarget.classList.add("hidden")
      this.turtleWrapperTarget.classList.add("hidden")

      // Active le select chat
      this.catWrapperTarget.querySelector("select").removeAttribute("disabled")

      // Désactive et vide le select chien
      this.dogWrapperTarget.querySelector("select").setAttribute("disabled", "disabled")
      this.dogWrapperTarget.querySelector("select").value = ""
      this.turtleWrapperTarget.querySelector("select").setAttribute("disabled", "disabled")
      this.turtleWrapperTarget.querySelector("select").value = ""

    } else if (type === "turtle") {
      this.turtleWrapperTarget.classList.remove("hidden")
      this.catWrapperTarget.classList.add("hidden")
      this.dogWrapperTarget.classList.add("hidden")

      this.turtleWrapperTarget.querySelector("select").removeAttribute("disabled")

      this.dogWrapperTarget.querySelector("select").setAttribute("disabled", "disabled")
      this.dogWrapperTarget.querySelector("select").value = ""
      this.catWrapperTarget.querySelector("select").setAttribute("disabled", "disabled")
      this.catWrapperTarget.querySelector("select").value = ""

    } else {
      // aucun animal choisi → on cache tout
      this.dogWrapperTarget.classList.add("hidden")
      this.catWrapperTarget.classList.add("hidden")
      this.turtleWrapperTarget.classList.add("hidden")
    }
  }
}
