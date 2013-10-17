class Sub < ActiveRecord::Base
  attr_accessible :name

  belongs_to :moderator, :class_name => "User", :inverse_of => :subs
  has_many :link_subs, :inverse_of => :sub
  has_many :links, :through => :link_subs, :source => :link, :inverse_of => :subs

  validates :name, :presence => true, :uniqueness => true
end
