class Directory < ApplicationRecord
  belongs_to :user
  validates :directory, presence: true, uniqueness: true
  validates :name, presence: true
end