class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15}
  validates :phone_number, presence: true, length: { maximum: 11}
  has_secure_password
end
