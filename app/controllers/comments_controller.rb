class CommentsController < ApplicationController
  before_action :set_comment, only: %w[ update destroy ]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to task_path(@comment.commentable_id), notice: "Comment successfully added" }
      else
        format.html { redirect_to task_path(@comment.commentable_id), notice: "Comment was not successfully added" }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        if @comment.commentable_type == "Task"
          format.html { redirect_to task_path(@comment.commentable_id), notice: "Comment successfully updated" }
        elsif @comment.commentable_type == "Comment"
          format.html { redirect_to task_path(@comment.origin_id), notice: "Comment commentated on successfully" }
        end
      else
        if @comment.commentable_type == "Task"
          format.html { redirect_to task_path(@comment.commentable_id), notice: "Comment was not successfully updated" }
        elsif @comment.commentable_type == "Comment"
          format.html { redirect_to task_path(@comment.origin_id), notice: "Comment NOT commentated on successfully" }
        end
      end
    end
  end

  def destroy
    @comment.destroy
    if @comment.commentable_type == "Task"
      redirect_to task_path(@comment.commentable_id), notice: "Comment successfully deleted"
    elsif @comment.commentable_type == "Comment"
      format.html { redirect_to task_path(@comment.origin_id), notice: "Comment NOT commentated on successfully" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :body, :user_id, :commentable_id, :commentable_type, :origin_id, :origin_type)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
