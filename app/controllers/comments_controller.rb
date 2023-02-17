class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to incident_path(@comment.incident)
    else
      redirect_to incident_path(@comment.incident)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, incident_id: params[:incident_id])
  end
end