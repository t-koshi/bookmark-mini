class Me::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = params[:q]
    @fqdn = params[:fqdn]
    @bookmarks = current_user.bookmarks
    if @q.present?
      web_resource_ids = WebResource.where("web_resources.title ILIKE ? OR web_resources.description ILIKE ?", "%#{@q}%", "%#{@q}%").pluck(:id)
      @bookmarks = @bookmarks.where(web_resource_id: web_resource_ids)
    end
    if @fqdn && fqdn_id = FullyQualifiedDomainName.find_by(value: @fqdn)
      web_resource_ids = WebResource.where(fully_qualified_domain_name_id: fqdn_id).pluck(:id)
      @bookmarks = @bookmarks.where(web_resource_id: web_resource_ids)
    end
    @bookmarks = @bookmarks.order(created_at: :desc).page(params[:page])
  end

  def new
  end

  def confirm
    outcome = WebResource::FindOrInitializeService.run(
      user: current_user,
      url: params[:url]
    )
    if outcome.valid?
      @web_resource = outcome.result
      if @web_resource.persisted? && bookmark = Bookmark.find_by(user: current_user, web_resource: @web_resource)
        @bookmark = bookmark
      end
    else
      redirect_to new_me_bookmark_path
    end
  end

  def create
    outcome = Bookmark::UpsertService.run(
      user: current_user,
      url: params[:url],
      comment: params[:comment]
    )
    if outcome.valid?
      redirect_to bokmark_entry_path(web_resource_id: outcome.result.web_resource_id, user_id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    @friend = Bookmark.find(params[:id])
    @friend.destroy
    redirect_to me_bookmarks_path
  end
end
