class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
end
