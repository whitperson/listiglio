# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :float
#  photo      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
