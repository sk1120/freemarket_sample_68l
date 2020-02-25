class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def logout
  end

  def new_credit_card
  end
end
