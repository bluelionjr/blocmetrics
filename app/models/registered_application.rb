class RegisteredApplication < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :url, presence: true

  has_many :events
end
