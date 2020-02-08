# frozen_string_literal: true

require 'open-uri'

class WebResource::FindOrCreateService < ActiveInteraction::Base
  string :url, default: nil

  validates :url, presence: true
  validate :valid_host

  def execute
    wr = WebResource.find_by(url: url)
    return wr if wr

    wr = compose(WebResource::InitializeService, url: url)
    wr.fully_qualified_domain_name = FullyQualifiedDomainName.find_or_create_by(value: URI.parse(url).host)

    unless wr.save
      errors.merge!(wr.errors)
    end

    wr
  end

  private

  def valid_host
    errors.add(:base, :invalid_url_host_name) unless URI.parse(url).host.present?
  end
end
