class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
