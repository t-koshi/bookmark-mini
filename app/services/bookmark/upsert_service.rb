# frozen_string_literal: true

require 'open-uri'

class Bookmark::UpsertService < ActiveInteraction::Base
  object :user, class: User, default: nil
  string :url, default: nil
  string :comment, default: ''

  validates :user, :url, presence: true

  def execute
    wr = compose(WebResource::FindOrCreateService, url: url)
    bookmark = compose(Bookmark::FindOrInitializeService, user: user, web_resource: wr)
    bookmark.comment = comment

    unless bookmark.save
      errors.merge!(bookmark.errors)
    end

    bookmark
  end
end
