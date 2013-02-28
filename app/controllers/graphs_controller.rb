class GraphsController < ApplicationController
  include SqsHelper
  include MessageHelper

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def show
    @graph = Graph.find(params[:id])
  end

  def new
    if signed_in?
      @graph = current_user.graphs.build
    end
  end

  def create
    @graph = current_user.graphs.build(params[:graph])
    if @graph.save
      flash[:success] = "Graph created! You'll receive and email when your graph is ready :)"
      queue = Queue.new :jobs
      @graph.source.url =~ /.*\/([^\/]+)\.([^\/\.]+)$/
      graph_name = $1
      graph_format = $2
      queue.queue_message job_message({ 
                                        user_id: current_user.id, 
                                        graph_id: @graph.id, 
                                        graph_name: graph_name, 
                                        graph_format: graph_format})
      GraphRenderingWorker.perform_async
      # UserMailer.graph_ready(current_user, @graph).deliver
      redirect_to root_path
    else
      @feed_items = []
      render new_graph_path
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