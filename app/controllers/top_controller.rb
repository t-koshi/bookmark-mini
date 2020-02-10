class TopController < ApplicationController
  def index
    @q = params[:q]
    @fqdn = params[:fqdn]
    @web_resources = WebResource::SearchService.run!(q: @q, fqdn: @fqdn, page: params[:page])
  end
end
