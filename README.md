# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Tested using RSpec.

Many features of this project were already in place. I was responsible for understanding the given code and updating these features:

### New Features

1. User Authentication (using bcrypt and has_secure_password). You can visit [here for reference](https://gist.github.com/thebucknerlife/10090014) as it was used for reference.
2. Admin creation of new categories
3. Sold out badge to show when products are not in stock.

### New Pages:

1. About Page
2. Admin Dashboard Page (with metrics on categories and products available in-store)
3. Order Details Page (updated with order information)

### Bug Fixes

1. Admin security to prevent certain activities for users.
2. Checking out prevention when cart is empty.

### Testing

1. To be updated.

### Home Page

!["Home Page"]()

### About Us Page

!["About Us Page"]()

### Category Example Page (Apparel)

!["Apparel Category"]()

### Item Sold Out

!["Item Sold Out"]()

### Signup Page

!["Signup Page"]()

### Login Page

!["Login Page"]()

### Cart Page

!["Cart Page"]()

### Order Fulfilled Page

!["Order Fulfilled Page"]()

## Admin

### Dashboard Page

!["Dashboard Page"]()

### Products Page

!["Products Page"]()

### Categories Page

!["Categories Page"]()

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
1. Remove Gemfile.lock
1. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

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

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
