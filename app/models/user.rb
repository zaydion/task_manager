class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
end
