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
    @vote = Vote.create(vote: params[:vote], creator: current_user, votable: @comment)
    if @vote.valid?
      flash[:notice] = "Your vote is counted."
    else
      flash[:error] = "Your can only vote for this comment once."
    end
    redirect_to :back
  end

  private

  def comments_param
    params.require(:comment).permit(:body, :post_id)
  end
end