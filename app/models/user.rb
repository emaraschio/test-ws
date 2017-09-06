class User < ApplicationRecord
  has_many :group_events

  validates_presence_of :name, :email, :password_digest
end
