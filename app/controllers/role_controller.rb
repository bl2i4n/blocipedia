class RoleController < ApplicationController

def upgrade(user)
  @user = user
  @user.premium!
  redirect_to edit_user_registration_path
end

end
