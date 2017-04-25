class CartsController < ApplicationController
    before_filter :initialize_cart
    
    def add
        @cart.add_item params[:id]
        session["cart"]=@cart.serialize
        product=Product.find params[:id]
        redirect_to :back,notice: "Added #{product.name} successfully to the cart."
    end
    
    def show 
        
    end
    
    def checkout
        if current_user
            @client_token=Braintree::ClientToken.generate
        @order_form=OrderForm.new user: current_user
        else
        @order_form=OrderForm.new user: User.new
        end
        @client_token=Braintree::ClientToken.generate
    end
end