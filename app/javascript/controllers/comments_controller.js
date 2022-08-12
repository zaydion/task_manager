import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['editCommentForm', 'newCommentForm', 'commentForm']

  showEditCommentForm() {
    this.editCommentFormTarget.hidden = false
  }

  showNewCommentForm() {
    this.newCommentFormTarget.hidden = false
  }

  hideCommentForm() {
    const openForm = this.commentFormTargets.find((element) => !element.hidden)
    openForm.hidden = true
  }
}
