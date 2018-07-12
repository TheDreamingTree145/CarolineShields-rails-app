class Player < ApplicationRecord
scope :under_18, lambda {where('age < ?',18)}
scope :over_18, lambda {where('age >= ?',18)}
  has_secure_password
  validates :name, uniqueness: true
  validates :name, :age, :address, :password, presence: true, on: :create
  has_many :positions
  has_many :sports, through: :positions


  def sports_attributes=(sport_attributes)
   sport_attributes.values.each do |sport_attribute|
      if !sport_attribute[:name].empty?

       sport = Sport.find_or_create_by(sport_attribute)
       self.sports << sport
     end
   end
 end





end
