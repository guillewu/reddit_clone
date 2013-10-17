module SubsHelper
  def current_user_moderates_sub?(sub)
    current_user != nil && sub.moderator_id == current_user.id
  end
end
