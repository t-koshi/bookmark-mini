class TopController < ApplicationController
  def index
    @q = params[:q]
    @fqdn = params[:fqdn]
    @bookmarks = Bookmark::SearchService.run!(q: @q, fqdn: @fqdn, page: params[:page])
  end
end
