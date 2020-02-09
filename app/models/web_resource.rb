# == Schema Information
#
# Table name: web_resources
#
#  id                             :uuid             not null, primary key
#  description                    :text             default("")
#  favicon_url                    :text             default("")
#  ogp_image_url                  :text             default("")
#  title                          :string           not null
#  url                            :text             default(""), not null
#  users_count                    :integer          default(0)
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  fully_qualified_domain_name_id :uuid             not null
#
# Indexes
#
#  index_web_resources_on_fully_qualified_domain_name_id  (fully_qualified_domain_name_id)
#
# Foreign Keys
#
#  fk_rails_...  (fully_qualified_domain_name_id => fully_qualified_domain_names.id)
#

class WebResource < ApplicationRecord
  belongs_to :fully_qualified_domain_name

  def fqdn
    fully_qualified_domain_name.value
  end

  def fqdn_url
    if /^https:\/\// === url
      "https://#{fqdn}"
    else
      "http://#{fqdn}"
    end
  end
end
