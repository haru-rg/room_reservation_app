class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  has_many :reservations

  def self.search(keyword, area)
    if keyword != nil
      where(
        [
          'room_address like? OR room_name like? OR room_introduction like? OR room_price like?',
          "%#{keyword}%",
          "%#{keyword}%",
          "%#{keyword}%",
          "%#{keyword}%",
        ],
      )
    else
      where(['room_address like?', "%#{area}%"])
    end
  end

  #   if keyword != nil
  #     where(['room_address like? OR room_name like?', "%#{keyword}%", "%#{keyword}%"])
  #   else
  #     where(['room_address like?' , "%#{area}%"])
  #   end
end
