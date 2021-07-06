class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  has_many :reservations

  def self.search(keyword, area)
    keyword != nil ? where(['room_address like? OR room_name like?', "%#{keyword}%", "%#{keyword}%"]) : where(['room_address like?', "%#{area}%"])
  end

  #   if keyword != nil
  #     where(['room_address like? OR room_name like?', "%#{keyword}%", "%#{keyword}%"])
  #   else
  #     where(['room_address like?' , "%#{area}%"])
  #   end
end
