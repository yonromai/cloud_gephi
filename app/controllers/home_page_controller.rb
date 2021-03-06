class HomePageController < ApplicationController
  def home
    if signed_in?
      @graph = current_user.graphs.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 15)
    end
  end
end
