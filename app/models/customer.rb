# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#

class Customer < ActiveRecord::Base
  has_many :orders
  has_many :vendors, through: :orders
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  

end
