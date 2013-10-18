class Comment < ActiveRecord::Base
  attr_accessible :text, :parent_comment_id

  validates :text, :presence => true

  belongs_to :user
  belongs_to :parent_comment, :class_name => "Comment"
  belongs_to :link

  has_many :child_comments, :foreign_key => :parent_comment_id, :class_name => "Comment"
end
