# == Schema Information
#
# Table name: bookmarks
#
#  id         :uuid             not null, primary key
#  comment    :string           default(""), not null
#  published  :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_bookmarks_on_site_id  (site_id)
#  index_bookmarks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#  fk_rails_...  (user_id => users.id)
#

class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :site
end
