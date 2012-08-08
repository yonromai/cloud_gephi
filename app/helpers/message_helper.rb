module MessageHelper

  def job_message params
    ActiveSupport::JSON.encode({
      type: "RENDER",
      params: params
    })
  end
end
