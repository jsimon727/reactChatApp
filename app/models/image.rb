class Image < ActiveRecord::Base

  has_many :messages, as: :messageable
end
