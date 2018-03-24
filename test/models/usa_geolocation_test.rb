# == Schema Information
#
# Table name: usa_geolocations
#
#  id         :integer          not null, primary key
#  address    :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UsaGeolocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
