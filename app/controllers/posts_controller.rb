class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = @current_user
    if @post.save
      @post.generate_slug.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.generate_slug.save
      flash[:notice] = "Your post was modified."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    vote = Vote.create(vote: params[:vote], creator: current_user, votable: @post)
    @vote_valid = vote.valid?
    @success_msg = "Your vote is counted."
    @error_msg = "You can only vote for this post once."
    respond_to do |format|
      format.html {
        if @vote_valid
          flash[:notice] = @success_msg
        else
          flash[:error] = @error_msg
        end
        redirect_to :back
      }

      format.js
    end
  end

  ### TO-DO: getter for post.creator.username


  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end