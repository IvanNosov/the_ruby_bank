module ApplicationHelper
  def users_list
    User.where.not(id: Current.user.id)
  end
end
