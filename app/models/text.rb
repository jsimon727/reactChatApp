class Text < ActiveRecord::Base
  has_many :messages, as: :messageable
  validates :body, presence: true
end

