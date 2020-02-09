# frozen_string_literal: true

class Bookmark::SearchService < ActiveInteraction::Base
  object :user, class: User, default: nil
  string :q, default: nil
  string :fqdn, default: nil
  integer :page, default: 1

  def execute
    result = user.present? ? user.bookmarks : Bookmark.all
    if q.present?
      web_resource_ids = WebResource.where("title ILIKE ? OR description ILIKE ?", "%#{q}%", "%#{q}%").pluck(:id)
      result.where!(web_resource_id: web_resource_ids)
    end
    if fqdn && fqdn_id = FullyQualifiedDomainName.find_by(value: fqdn)
      web_resource_ids = WebResource.where(fully_qualified_domain_name_id: fqdn_id).pluck(:id)
      result.where!(web_resource_id: web_resource_ids)
    end

    result.order(created_at: :desc).page(page)
  end
end
