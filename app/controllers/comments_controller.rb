class CommentsController < ApplicationController
  before_action :set_comment, only: %w[ update destroy ]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = User.first # TODO[Jose]: make current_user

    class_name = @comment.commentable.class.to_s
    if class_name == "Comment"
      @comment.origin_id = @comment.commentable.origin_id
      @comment.origin_type = @comment.commentable.origin_type
    elsif class_name == "Task"
      @comment.origin_id = @comment.commentable.id
      @comment.origin_type = class_name
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to task_path(@comment.origin_id), notice: "Comment successfully added" }
      else
        format.html { redirect_to task_path(@comment.origin_id), notice: "Comment was not successfully added" }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to task_path(@comment.origin_id), notice: "Comment on Task successfully updated" }
      else
        format.html { redirect_to task_path(@comment.origin_id), notice: "Comment was not successfully updated" }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to task_path(@comment.origin_id), notice: "Comment successfully deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :body, :commentable_id, :commentable_type)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
