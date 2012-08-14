class GraphRenderingWorker
  include Sidekiq::Worker
  include SqsHelper
  include ActionMailer

  def perform
    queue = Queue.new :callback
    msg = queue.dequeue_message
    if msg.nil?
      raise
    end
    dict = ActiveSupport::JSON.decode(msg.body)
    usr = User.find(dict["params"]["user_id"])
    graph = usr.graphs.find(dict["params"]["graph_id"])
    graph.image = "https://s3.amazonaws.com/dev-cloudgephi/users/%s/graphs/%s/%s" % [dict["params"]["user_id"], dict["params"]["graph_id"], dict["params"]["graph_name"]]
    graph.save!
    msg.delete
    UserMailer.graph_ready(usr, graph).deliver
  end
end