module SqsHelper
  class Queue
    def initialize(queue)
      sqs = AWS::SQS.new
      case queue
      when :jobs
        @queue = sqs.queues.named('cloudgephijobs')
      when :callback
        @queue = sqs.queues.named('cloudgephicallback')
      else
        @queue = nil
      end
    end

    def queue_message(msg)
      @queue.send_message(msg)
    end

    def dequeue_message
      @queue.receive_message
    end
  end
end