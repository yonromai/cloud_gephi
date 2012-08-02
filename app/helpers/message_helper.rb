module MessageHelper

  def job_message user_id, graph_id
    "{
    \"job_type\" : \"render_graph\",
    \"params\" : {
      \"user_id\" : \"#{user_id}\",
      \"graph_id\" : \"#{graph_id}\"
    }
  }"
  end
end
