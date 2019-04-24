require 'pry'
def consolidate_cart(cart)
  # code here
  result = {}
  cart.each do |hash|
    hash.each do |k, v|
      if v[:count] != nil && result[k] != nil
        v[:count] += 1
      end
      
      if result[k] == nil
        result[k] = v
        v[:count] = 1
      end
    end
  end
  result
end

def apply_coupons(cart, coupons)
  # code here
  coupon_food = ""
  coupon_count = coupon_cost = cart_count = 0
  food_clearance = correct_coupon = false
  #look at coupon first and grab the item, num, and cost
  #need to check for multiple coupons
  #update the cart hash with the coupon by iterating through it
  cart.map do |food, food_hash|
    binding.pry
    coupons.each do |hash|
      hash.each do |k, v|
        case k
          when :item
            coupon_food = v
          when :num
            coupon_count = v
          when :cost
            coupon_cost = v
        end
        binding.pry
        if food == coupon_food
          cart_count = v[:count]
          food_clearance = v[:clearance]
          v[:count] -= coupon_count
          correct_coupon = true
        end
      end
    end
  end
  
  # add the coupon food to the hash
  cart[coupon_food + " W/COUPON"] = {:price => coupon_cost, :clearance => food_clearance, :count => (cart_count / coupon_count)} if correct_coupon
  cart
  #binding.pry
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end