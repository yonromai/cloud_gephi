class GraphRenderingWorker
  include Sidekiq::Worker
  include SqsHelper

  def perform
    queue = Queue.new :jobs
    msg = queue.dequeue_message
    dict = ActiveSupport::JSON.decode(msg.body)
    usr = User.find(dict["params"]["user_id"])
    graph = usr.graphs.find(dict["params"]["graph_id"])
    graph.image = "https://gephi.org/wp-content/themes/gephi/images/screenshots/layout2.png"
    graph.save!
    msg.delete
  end
end