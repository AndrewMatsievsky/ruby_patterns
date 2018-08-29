# Encapsulate request in object and passes it to specific receiver

$ORDERS_QUEUE = [] # Assuming that there are some kind of  queue

class Order
  # Command Interface implementat
  def execute
    return "Abstract execute call!"
  end
end


class MenuOrder < Order
  # Concrete Command implementation
  def initialize(order_list)
    @order_list = order_list
  end

  def execute
    return "Cooking: #{@order_list}"
  end
end


class Cook
# This class is Receiver implentation. It executes our Command instance
  def execute_orders
    $ORDERS_QUEUE.each_with_index do |order, index|
      puts "##{index + 1}. #{order.execute}"
    end
  end
end

order_one = MenuOrder.new(['Coffee', 'Doughnut'])

order_two = MenuOrder.new(['Tea', 'Breakfast #1'])

$ORDERS_QUEUE.push(order_one, order_two)

cook = Cook.new

cook.execute_orders
