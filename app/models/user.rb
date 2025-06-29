class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :directory, presence: true, uniqueness: true
  # DEL has_many :directories, dependent: :destroy
end