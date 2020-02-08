# == Schema Information
#
# Table name: fully_qualified_domain_names
#
#  id         :uuid             not null, primary key
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_fully_qualified_domain_names_on_value  (value) UNIQUE
#

class FullyQualifiedDomainName < ApplicationRecord
  has_many :web_resources
end
