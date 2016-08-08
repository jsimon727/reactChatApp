class Video < ActiveRecord::Base
  has_many :messages, as: :messageable
end
