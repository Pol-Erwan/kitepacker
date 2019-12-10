class AvatarsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
      if params[:avatar] == nil
	redirect_to(edit_user_registration_path(@user))	
      else
        @user.avatar.attach(params[:avatar])
        redirect_to(edit_user_registration_path(@user))
      end
  end

end
