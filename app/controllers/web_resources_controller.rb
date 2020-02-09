class WebResourcesController < ApplicationController
  def entry
    @bookmark = Bookmark.find_by(web_resource_id: params[:web_resource_id], user_id: params[:user_id])
    redirect_to root_path and return unless @bookmark
  end
end
