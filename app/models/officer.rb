class Officer < ActiveRecord::Base
      validates :first_name, presence: true, length: { maximum: 50 }
      validates :last_name, presence: true, length: { maximum: 50 }
      validates :number, presence: true, uniqueness: true
     has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
has_many :incidents
end
