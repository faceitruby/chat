class PersonsController < ApplicationController
  def profile
    @user = current_user
  end
end
