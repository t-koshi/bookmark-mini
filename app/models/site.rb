# == Schema Information
#
# Table name: sites
#
#  id                             :uuid             not null, primary key
#  description                    :text             default(""), not null
#  ogp_image_url                  :text             default(""), not null
#  title                          :string           not null
#  url                            :text             default(""), not null
#  users_count                    :integer          not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  fully_qualified_domain_name_id :uuid             not null
#
# Indexes
#
#  index_sites_on_fully_qualified_domain_name_id  (fully_qualified_domain_name_id)
#
# Foreign Keys
#
#  fk_rails_...  (fully_qualified_domain_name_id => fully_qualified_domain_names.id)
#

class Site < ApplicationRecord
end
