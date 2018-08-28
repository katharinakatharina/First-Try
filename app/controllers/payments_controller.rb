class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i, # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail],
        receipt_email: params[:stripeEmail],
      )

      if charge.paid

        order = Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )

        UserMailer.order_placed(@user, @product).deliver_now

      #redirect_to '/payments/success'
      @notice = "Your payment was processed successfully. Thank you for purchasing."
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      @alert = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product), :notice => @notice , :alert => @alert
  end
end
