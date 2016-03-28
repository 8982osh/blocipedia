# Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_LpviKpiWPQ6i3dwBhR1JlAig'],
   secret_key: ENV['sk_test_W6Uzl16Z6DIpw7svbmICAhdS']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]