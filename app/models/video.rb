class Video < ApplicationRecord
  has_many :messages, as: :messageable
end
