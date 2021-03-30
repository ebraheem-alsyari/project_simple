class SectionEdit < ApplicationRecord

    
    
    
    
    belongs_to :admin_user


    has_many :admin_users


    belongs_to :section
    
    

	
end
