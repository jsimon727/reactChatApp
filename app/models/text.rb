class Text < ApplicationRecord
  has_many :messages, as: :messageable
end

