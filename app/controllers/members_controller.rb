class MembersController < ApplicationController

  def create
    success = Member.new(member_params).save
    if success
    session[:user_id]=Member.last.id
    end
    session[:member]=is_member?

    redirect_to :root
  end

  private

  def member_params
    params.require(:member).permit(:username, :email, :password, :password_confirmation)
  end

end
