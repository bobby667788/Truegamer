class OrdersController < ApplicationController
    before_filter :initialize_cart
    def create
        @order_form=OrderForm.new(user: User.new(order_params[:user]),cart: @cart)
        if @order_form.save
            notify_user
                if charge_user
            redirect_to products_path,notice:"Thank You for placing the order sir."
                end
        else
        render "carts/checkout",notice:"Something went wrong please try again."
        end
    end
    
    def custom
       @order_form=OrderForm.new(user: current_user,cart: @cart) 
          if @order_form.save
              notify_user
              if charge_user
            redirect_to products_path,notice:"Thank You for placing the order sir."
              end
        else
        render "carts/checkout",notice:"Something went wrong please try again sir."
        end
    end
    
   private
    
    def notify_user
      OrderMailer.order_confirmation(@order_form.order).deliver  
    end
    
    def order_params
        params.require(:order_form).permit(
            user:[:name,:phone,:address,:city,:country,:postal_code,:email])
    end
    
    def charge_user
        transaction=OrderTransaction.new(@order_form.order,params[:payment_method_nonce])
        transaction.execute
        transaction.ok?
    end
end