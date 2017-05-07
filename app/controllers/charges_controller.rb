class ChargesController < ApplicationController

  def created
    #creates a stripe customer object, for charging customer
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    #where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, #this is not the user_id in your app
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to user_path(current_user) #can redirect_to wherever

    #stripe will send back CardErrors, with friendly messages when something goes wrong
    #this `rescue block` catches and displays those errors
  rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path

  end

end
