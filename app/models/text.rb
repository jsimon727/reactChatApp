class Text < ActiveRecord::Base
  has_many :messages, as: :messageable
end

