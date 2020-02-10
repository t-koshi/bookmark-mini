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
    is_new_record = bookmark.new_record?
    bookmark.comment = comment

    if bookmark.save
      WebResource::UpdateUsersCountJob.perform_later(bookmark.web_resource.id) if is_new_record
    else
      errors.merge!(bookmark.errors)
    end

    bookmark
  end
end
