class DestinationsController < ApplicationController
  def show
    @destination = Destination.find(params[:id])
    @posts = @destination.most_recent_posts
    @featured = @destination.featured
    @average_age = @destination.average_blogger_age
  end
end
