class Video < ActiveRecord::Base
  has_many :messages, as: :messageable
  validates :link, presence: true
end
