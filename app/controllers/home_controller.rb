require 'pry-remote'

class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.all
    @accounts = current_user.accounts
    render "index"
  end

end