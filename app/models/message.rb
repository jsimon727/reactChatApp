class Message < ApplicationRecord
  belongs_to :messageable, polymorphic: true

  MESSAGE_TYPES = [ "image", "video", "text"]
  #
  # scope :between, lambda {|participant_one, participant_two|
  # joins("INNER JOIN messages ON messgaes.sender_id = #{participant_one}
  # AND messages.recipient_id = #{participant_two}")
  # }

end
