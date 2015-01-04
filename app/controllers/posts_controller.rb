class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  def index
    @posts = Post.all

  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)    
      
      if @post.save
        flash[:notice] = "Your post was created."
        redirect_to post_path(@post)
      else
        render :new
      end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
        flash[:notice] = "Your post was updated."
        redirect_to posts_path
      else
        render :new
      end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title,:url,:description, category_ids: [])
    end
end
