class Link < ActiveRecord::Base
  attr_accessible :text, :title, :url, :sub_ids

  validates :title, :url, :presence => true
  validates :subs, :presence => true

  has_many :link_subs, :inverse_of => :link

  has_many :subs, :through => :link_subs, :source => :sub, :inverse_of => :links

  belongs_to :user, :inverse_of => :links
end
