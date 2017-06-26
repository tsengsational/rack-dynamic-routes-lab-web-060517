require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # @@items = []
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_match = @@items.find {|item| item.name == item_name}
      if !item_match.nil?
        # binding.pry
        price = item_match.price
        resp.write "#{price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish


  end

end
