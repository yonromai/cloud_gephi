class HomePageController < ApplicationController
  def home
    if signed_in?
      @graph = current_user.graphs.build if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
