class Subject < ApplicationRecord
    has_many :pages 

    
    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("position ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :serach, lambda { |query| where(["name LIKE ?", "%#{query}%"])

}
  

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    # validates_presence_of vs. validates_lenght_of :minimum => 1
    # different error messages: "can't be blank" or "is too short"
    # validates_lenght_of allws strings with only spaces!
end









