class Incident < ActiveRecord::Base
        scope :animalsname_like, -> (animalsname) { where("animalsname like ?", animalsname)}
      has_one :animal
   has_many :officers
        validates_presence_of :code
        validates_presence_of :officer
  
end
