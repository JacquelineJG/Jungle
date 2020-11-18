# Jungle

Welcome to Jungle, a mini e-commerce application where users can make purchases on items sold! Admins are able to create categories and products, while users are able to shop around the store and add to their carts. 

## Screenshots
!["Signup and adding products to cart"](https://github.com/JacquelineJG/Jungle/blob/master/docs/Jungle-signup-addcart.gif?raw=true)
!["Screenshot of cart page"](https://github.com/JacquelineJG/Jungle/blob/master/docs/show-cart-page.png?raw=true)
!["Screenshot of order display after payment](https://github.com/JacquelineJG/Jungle/blob/master/docs/show-cart-page.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. You can use any future date for the expiration, and any 3 digit code.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
