class LinkSub < ActiveRecord::Base
  # attr_accessible :link_id, :sub_id
  belongs_to :link, :inverse_of => :link_subs
  belongs_to :sub, :inverse_of => :link_subs
end
