class GraphsController < ApplicationController
  include SqsHelper
  include MessageHelper

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
    #Mock... To delete
    # params[:graph][:image] = "https://gephi.org/wp-content/themes/gephi/images/screenshots/layout2.png"
    # params[:graph][:source] = "https://gephi.org/datasets/eurosis.gexf.zip"
    #End Mock
    @graph = current_user.graphs.build(params[:graph])
    if @graph.save
      flash[:success] = "Graph created!"
      queue = Queue.new :jobs
      queue.queue_message job_message(current_user.id, @graph.id)
      GraphRenderingWorker.perform_async
      redirect_to root_path
    else
      @feed_items = []
      render 'home_page/home'
    end
  end

  def destroy
    @graph.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @graph = current_user.graphs.find_by_id(params[:id])
      redirect_to root_path if @graph.nil?
    end

end