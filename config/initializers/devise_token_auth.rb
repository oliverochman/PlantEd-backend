DeviseTokenAuth.setup do |config|
  config.enable_standard_devise_support = true
  config.change_headers_on_each_request = false
end


Devise.setup do |config|
  config.secret_key = '8048ddd31b8c87b9ef851cb7b8a62e6f39d1c70c03877223b977c71557892d48ed87577167f5eebf0c084cbcf14d4ab133a709976c0a5096e6e6a05078d10beb'
end