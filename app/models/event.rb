class Event < ActiveRecord::Base
  belongs_to :activity
  has_and_belongs_to_many :users
  has_many :messages
  has_many :flakes
end
