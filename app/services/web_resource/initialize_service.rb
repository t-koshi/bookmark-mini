# frozen_string_literal: true

require 'open-uri'

class WebResource::InitializeService < ActiveInteraction::Base
  string :url, default: nil

  validates :url, presence: true
  validate :valid_url

  def execute
    doc = Nokogiri::HTML(open(url))
    wr = WebResource.new
    wr.title = doc.xpath('//title').inner_text.presence || URI.parse(url).path.split('/')
    wr.description = doc.xpath("//meta[@name='description']/@content").inner_text.presence
    wr.description = doc.xpath("//meta[@property=\"og:description\"]/@content").first&.value unless wr.description.present?
    wr.favicon_url = doc.xpath("//head/link[@rel=\"shortcut icon\" or @rel=\"icon\"]/@href").first&.value.presence
    wr.ogp_image_url = doc.xpath("//meta[@property=\"og:image\"]/@content").first&.value.presence
    wr.url = url
    wr
  rescue URI::InvalidURIError
    WebResource.new(title: URI.parse(URI.encode(url)).path.split('/').last[0..255], url: url)
  end

  private

  def valid_url
    errors.add(:base, :invalid_url) unless URI::regexp(%w(http https)) === url
  end
end
