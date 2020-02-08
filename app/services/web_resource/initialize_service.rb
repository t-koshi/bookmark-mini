# frozen_string_literal: true

require 'open-uri'

class WebResource::InitializeService < ActiveInteraction::Base
  string :url, default: nil

  validates :url, presence: true

  def execute
    doc = Nokogiri::HTML(open(url))
    wr = WebResource.new
    wr.title = doc.xpath('//title').inner_text.presence || URI.parse(url).path.split('/')
    wr.description = doc.xpath("//meta[@name='description']/@content").inner_text.presence
    wr.description = doc.xpath("//meta[@property=\"og:description\"]/@content").first&.value unless wr.description.present?
    wr.ogp_image_url = doc.xpath("//meta[@property=\"og:image\"]/@content").first&.value.presence
    wr.url = url
    wr
  rescue URI::InvalidURIError
    WebResource.new(title: URI.parse(URI.encode(url)).path.split('/').last[0..255], url: url)
  end
end
