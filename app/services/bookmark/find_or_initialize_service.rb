# frozen_string_literal: true

require 'open-uri'

class Bookmark::FindOrInitializeService < ActiveInteraction::Base
  object :user, class: User, default: nil
  object :web_resource, class: WebResource, default: nil

  validates :user, :web_resource, presence: true

  def execute
    Bookmark.find_or_initialize_by(user: user, web_resource: web_resource)
  end
end
