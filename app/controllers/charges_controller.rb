class ChargesController < ApplicationController
  
 def create
   
   # Creates a Stripe Customer object, for associating with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: Amount.default,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
   #if current_user.update(premium :true)
   flash[:notice] = "Thanks for all the money, #{current_user.email}! Membership upgraded to Premium."
   redirect_to user_path(current_user) # or wherever
   #redirect_to edit_user_registration_path to upgrade role
   # Stripe will send back CardErrors, with friendly messages when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: Amount.default
    }	
  end
end

#Set default Premium Membership amount
#class Amount

#  def self.default
#    @amount = 15_00
#  end
#end





