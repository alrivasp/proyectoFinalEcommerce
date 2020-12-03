class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.permission_level == 0 
        redirect_to shopping_main_path
      else 
        redirect_to ordermanager_main_path
      end
    end
  end

  def tallas
    
  end
end
