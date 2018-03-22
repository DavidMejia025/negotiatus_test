class Customer < ActiveRecord::Base
  has_many :orders
  has_many :vendors, through: :orders
end
