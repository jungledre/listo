class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :events
  has_many :messages
  has_many :flakes, foreign_key: "flaked_id"
  has_many :narks, class_name: "Flake", foreign_key: "nark_id"
  has_many :flags, foreign_key: "flagged_id"
  has_many :reports, class_name: "Flag", foreign_key: "reporter_id"

  validates :first_name, presence: true,
    length: {
      maximum: 40
    }
  validates :last_name, presence: true,
    length: {
      maximum: 40
    }
  validates :email, presence: true,
    uniqueness: true,
    :email => true
  validates :password,
    length: {
      minimum: 5,
      maximum: 1000
    }, on: :create

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create

  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end

  def flake_score
    self_flakes = self.flakes.where({nark_id: self.id}).length.to_f
    #groups by event... retuns hash of counts for each event_id
    other_flakes = self.flakes.where.not({nark_id: self.id}).group(:event_id).count.length.to_f
    event_count = self.events.length.to_f

    puts self_flakes
    puts other_flakes
    puts event_count

    score = (((other_flakes + (self_flakes/2))/(event_count+self_flakes))*100)
    if score.nan?
      score = 0
    end
    score.to_i
  end


end
