class Page < ApplicationRecord

    
    belongs_to :subject, { :optional => false }
    has_and_belongs_to_many :admin_users



    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("position ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :serach, lambda { |query| where(["name LIKE ?", "%#{query}%"])}
  
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_presence_of :permalink
    validates_length_of :permalink, :within => 5..255
    # use presence_of with length_of to disallow spaces
    validates_uniqueness_of :permalink
    # for unique values by subject use ":scope => :subject_id"
    
  



end
