class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :events

  validates :name, uniqueness: true
end
