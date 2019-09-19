class ControlUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end
end
