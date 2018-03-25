# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vendor < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
