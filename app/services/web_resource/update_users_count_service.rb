# frozen_string_literal: true

require 'open-uri'

class WebResource::UpdateUsersCountService < ActiveInteraction::Base
  object :web_resource, class: WebResource, default: nil

  validates :web_resource, presence: true

  def execute
    web_resource.update(users_count: web_resource.bookmarks.size)
    web_resource.reload
  end
end
