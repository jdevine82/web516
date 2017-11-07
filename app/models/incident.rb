class Incident < ActiveRecord::Base
        scope :animalsname_like, -> (animalsname) { where("animalsname like ?", animalsname)}


  
end
