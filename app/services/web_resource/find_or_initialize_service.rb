# frozen_string_literal: true

require 'open-uri'

class WebResource::FindOrInitializeService < ActiveInteraction::Base
  string :url, default: nil

  validates :url, presence: true

  def execute
    if wr = WebResource.find_by(url: url)
      wr
    else
      compose(WebResource::InitializeService, url: url)
    end
  end
end
