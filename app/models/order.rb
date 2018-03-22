class Order < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :customer
end
