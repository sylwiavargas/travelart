class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def new
    @errors = flash[:errors]
    @blogger = Blogger.new
  end

  def create
    blogger = Blogger.create(blogger_params)
    if blogger.valid?
      redirect_to blogger_path(blogger)
    else
      flash[:errors] = blogger.errors.full_messages
      redirect_to new_blogger_path
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @post = @blogger.most_liked_post 
    @destinations_array = @blogger.most_written_about_destinations
  end

  private 
  def blogger_params
    params.require(:blogger).permit(:bio, :name, :age)
  end
end
