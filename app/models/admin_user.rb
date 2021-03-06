class AdminUser < ApplicationRecord
  #  self.table_name = "admin_users"
has_secure_password

has_and_belongs_to_many :pages









has_many :section_edits
has_many :sections, through: :section_edits

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
FORBIDDEN_USERNAME = %w[username administrator].freeze

# "sexy" validations
validates :first_name, presence: true,
                       length: { maximum: 25 }
validates :first_name, presence: true,
                       length: { maximum: 50 }
validates :username, length: { within: 5..25 },
                     uniqueness: true
validates :email, presence: true,
                  length: { maximum: 100 },
                  format: VALID_EMAIL_REGEX,
                  confirmation: true
validates :password, presence: true,
                       length: { maximum: 25 }

# validate :username_is_allowed

scope :sorted, lambda { order('last_name ASC', 'first_name ASC') }

def name
  "#{first_name} #{last_name}"
  # Or: first_name + ' ' + last_name
  # Or: [first_name, last_name.join(' ')]
end

private

  # def username_is_allowed
  #   errors.add(:username, 'has been restricted from use.') if FORBIDDEN_USERNAME.include?(username)
  # end
end
