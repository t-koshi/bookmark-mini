class WebResource::UpdateUsersCountJob < ApplicationJob
  queue_as :default

  def perform(web_resource_id)
    if web_resource = WebResource.find_by(id: web_resource_id)
      WebResource::UpdateUsersCountService.run!(web_resource: web_resource)
    end
  end
end
