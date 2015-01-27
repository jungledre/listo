class ActivitiesUsers < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validates :activity_id, uniqueness: true
end
