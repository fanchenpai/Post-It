class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_param)
    @comment.creator = @current_user
    if @comment.save
      flash[:notice] = "You comment is saved."
      redirect_to post_path(@post)
    else
      @post.comments.reload
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    vote = Vote.create(vote: params[:vote], creator: current_user, votable: @comment)
    @vote_valid = vote.valid?
    @success_msg = "Your vote is counted."
    @error_msg = "Your can only vote for this comment once."
    respond_to do |format|
      format.html {
        if @vote.valid
          flash[:notice] = @success_msg
        else
          flash[:error] = @error_msg
        end
        redirect_to :back
      }

      format.js {
        @obj = @comment
        render 'shared/vote'
      }
    end
  end

  private

  def comments_param
    params.require(:comment).permit(:body, :post_id)
  end
end