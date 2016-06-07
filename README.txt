Tools used: Ruby 2.2.3 - Rails 4.2.4
Gems Used:
    gem 'mysql2', '~>0.3.18'
    gem 'devise', '3.4.1'
    gem 'bootstrap-sass'
    gem 'jquery-turbolinks'
    gem 'stripe'
    gem 'haml-rails'

Payment dummy gateway service used: Stripe
with test_api_key existed in secrets.yml in config directory

6 Controllers were generated:
    - carts: for managing the shopping cart operations
    - charges: for managing the payment process
    - order_lines: for managing the order_lines operations
    - order: for managing the order operations
    - products: for managing the order operations 

Requirments Covered:
- Customer can login with email / signup
- Customer can view his/her Orders List, ordered by date descending
- Customer can view all products
- Customer can add a Product to his Shopping Cart
- Customer can place an order after items to his/her shopping cart

- Customer can pay through the payment gateway dummy service which is stripe

- After payment is done customer is redirected to his orders list with changing the status of the order that has been paid

- Customer can add a new product
- Existing Products can be edited

Test Cases:
Products Controller, Product Model
Order Controller, Order Model

