import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['editForm']

  showEditForm() {
    this.editFormTarget.hidden = false
  }

  hideEditForm() {
    this.editFormTarget.hidden = true
  }
}
