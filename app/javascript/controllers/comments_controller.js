import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['commentForm']
  static values = { index: Number }

  showCommentForm() {
    const element = document.getElementById(
      `comment-form-container-${this.indexValue}`
    )
    element.hidden = false
  }

  hideCommentForm(e) {
    e.preventDefault()
    const element = document.getElementById(
      `comment-form-container-${this.indexValue}`
    )
    element.hidden = true
  }
}
