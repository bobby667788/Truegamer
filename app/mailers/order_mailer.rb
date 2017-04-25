class OrderMailer < ActionMailer::Base
    default from: "bobbyverma946@yahoo.in"
    
    
    def order_confirmation order
        @order=order
        mail to: order.user.email, subject: "Your order (##{order.id})"
    end
end
