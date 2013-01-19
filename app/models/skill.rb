class Skill < ActiveRecord::Base
  attr_accessible :description

  has_and_belongs_to_many :users

  def to_s
    description
  end
end
