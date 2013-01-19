class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :location, :master, :skills

  has_and_belongs_to_many :skills

  validates_presence_of :name, :location
  validates_inclusion_of :master, in: [true, false]

  def title
    master? ? "Master" : "Apprentice"
  end
end
