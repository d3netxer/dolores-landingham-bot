# Rack::Attack.list('allow from 54.175.193.208') do |req|
#   # Requests are allowed if the return value is truthy
#   '127.0.0.1' == req.ip
# end

# Rack::Attack.whitelist('allow from localhost') do |req|
#   # Requests are allowed if the return value is truthy
# #   '127.0.0.1' == req.ip
# # end
# Rack::Attack.blacklist('allow from 54.173.139.250') do |req|
#   # Requests are allowed if the return value is truthy
#   '54.173.139.250' != req.ip
# end

# Rack::Attack.whitelist('allow from 54.173.139.250') do |req|
#   # Requests are allowed if the return value is truthy
#   '54.173.139.250' == req.ip || '127.0.0.1' == req.ip
# end


