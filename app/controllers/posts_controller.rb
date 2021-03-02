class PostsController < ApplicationController
  before_action :set_form_variables, only: [:new, :edit]
  before_action :set_post, only: [:show, :edit, :update, :like_it]
  before_action :set_errors, only: [:new, :edit]

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.valid?
      redirect_to post
    else
      flash[:errors] = post.errors.full_messages
      redirect_to new_post_path(post)
    end
  end

  def show
    @author = @post.blogger
    @destination = @post.destination
    @content = @post.formatted_content
    @likes = @post.likes
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def like_it
    updated_like_count = @post.likes + 1
    @post.update(likes: updated_like_count)
    redirect_to @post
  end

  private
  def set_form_variables
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :blogger_id, :destination_id, :content)
  end

  def set_errors
    @errors = flash[:errors]
  end

end
