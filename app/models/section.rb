class Section < ApplicationRecord
    
    
    # belongs_to :page
    
    has_many :section_edits
    
    has_many :admin_users, :through => :section_edits
    
    
    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("position ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :serach, lambda { |query| where(["name LIKE ?", "%#{query}%"])
}


CONTENT_TYPES = ['text', 'HTML']

validates_presence_of :name
validates :name, presence: true, length: { maximum: 255 }

validates_inclusion_of :content_type, in: CONTENT_TYPES,
                                    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
validates_presence_of :content







end




