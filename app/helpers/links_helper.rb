module LinksHelper
  def current_user_owns_link?(link)
    current_user != nil && current_user.id == link.user_id
  end
end
