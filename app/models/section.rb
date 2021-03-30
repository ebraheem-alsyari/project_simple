class Section < ApplicationRecord




        scope :visible, lambda { where(:visible => true) }
        scope :invisible, lambda { where(:visible => false) }
        scope :sorted, lambda { order("position ASC") }
        scope :newest_first, lambda { order("created_at DESC") }
        scope :serach, lambda { |query| where(["name LIKE ?", "%#{query}%"])
    
    }
      
        # belongs_to :page

        has_many :section_edits

        has_many :admin_users, :through => :section_edits
   



end




