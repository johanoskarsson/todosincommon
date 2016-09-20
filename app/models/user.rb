# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  auth_hash     :string           not null
#  email         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  foursquare_id :integer
#

class User < ActiveRecord::Base
end
