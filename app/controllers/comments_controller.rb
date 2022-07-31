class CommentsController < ApplicationController
  before_action :set_comment, only: %w[ update destroy ]

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        if @comment.commentable_type == "Task"
          format.html { redirect_to task_path(@comment.commentable_id), notice: "Comment successfully updated" }
        else
          # handle navigating to comments comments task
          # might need to associate a comment with a task
          format.html { redirect_to tasks_path, notice: "did not update a Task's comment" }
        end
      else
        if @comment.commentable_type == "Task"
          format.html { redirect_to task_path(@comment.commentable_id), notice: "Comment was not successfully updated" }
        else
          # handle navigating to comments comments task
          # might need to associate a comment with a task
          format.html { redirect_to tasks_path, notice: "did not try to update a Task's comment" }
        end
      end
    end
  end

  def destroy
    @comment.destroy
    if @comment.commentable_type == "Task"
      redirect_to task_path(@comment.commentable_id), notice: "Comment successfully deleted"
    else
      # handle navigating to comments comments task
      # might need to associate a comment with a task
      redirect_to tasks_path, notice: "did not update a Task's comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :body, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
