class User < ActiveRecord::Base
  ROLES = %w(administrator user)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :advertisers

  # Validations
  validate :first_name, :last_name, :role, :email, presence: true
  validate :password, :password_confirmation, presence: true, :on => :create

  def full_name
    "#{first_name.humanize} #{last_name.humanize}"
  end

  ROLES.each do |r|
    define_method "#{r}?" do
      role == r
    end
  end
end
