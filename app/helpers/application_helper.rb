module ApplicationHelper
  def private_wikis?
    current_user && current_user.role != 'standard'
  end

end
