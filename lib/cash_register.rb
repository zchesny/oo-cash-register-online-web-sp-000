class CashRegister

  attr_accessor :total, :discount, :items, :last_item_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price = nil
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    self.items << Array.new(quantity, title)
    self.items = self.items.flatten
    self.last_item_price = (price * quantity)
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total -= (self.total * self.discount * 0.01)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_price
  end

end
