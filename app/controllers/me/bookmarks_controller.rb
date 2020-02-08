class Me::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
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
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end
end
