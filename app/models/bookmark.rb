# == Schema Information
#
# Table name: bookmarks
#
#  id              :uuid             not null, primary key
#  comment         :string           default(""), not null
#  published       :boolean          default(TRUE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :uuid             not null
#  web_resource_id :uuid             not null
#
# Indexes
#
#  index_bookmarks_on_user_id          (user_id)
#  index_bookmarks_on_web_resource_id  (web_resource_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (web_resource_id => web_resources.id)
#

class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :web_resource
end
