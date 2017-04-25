class ApplicationController < ActionController::Base
     before_filter :initialize_cart
    before_filter :find_categories
  protect_from_forgery with: :exception
    
    
    def initialize_cart
        @cart=Cart.build_from_hash session
    end
    
    
    def find_categories
        @categories=Category.all
    end
    
    
    def authenticate_admin!
        authenticate_user!
        unless current_user.admin?
            redirect_to root_path,alert: "You are not allowed don't even think about it."
        end
    end
    
end

