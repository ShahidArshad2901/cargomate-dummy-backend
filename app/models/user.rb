class User < ApplicationRecord
  validates :frontegg_id, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
