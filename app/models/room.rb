class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user

  def self.search(keyword)
    where(['room_address like? OR room_name like?', "%#{keyword}%", "%#{keyword}%"])
  end
end
