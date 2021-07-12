class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  has_many :reservations

  def self.search(keyword, area)
    if keyword != nil
      return(
        where(
          [
            'room_address like? OR room_name like? OR room_introduction like? OR room_price like?',
            "%#{keyword}%",
            "%#{keyword}%",
            "%#{keyword}%",
            "%#{keyword}%",
          ],
        )
      )
    else
      return where(['room_address like?', "%#{area}%"])
    end
  end
end
