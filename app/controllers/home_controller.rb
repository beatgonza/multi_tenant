class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.all
    @accounts = current_user.accounts
  end

end