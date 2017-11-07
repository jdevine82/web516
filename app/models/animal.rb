class Animal < ActiveRecord::Base
    scope :animalsname_like, -> (animalsname) { where("animalsname like ?", animalsname)}
   has_many :incidents
end
