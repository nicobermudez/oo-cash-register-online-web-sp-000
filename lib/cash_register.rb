class CashRegister
  attr_accessor :total, :discount, :quantity, :title, :price, :last_transaction, :items


  def initialize(discount = 0)
    @total=0
    @discount=discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.total+=(price*quantity)
    self.last_transaction = price*quantity
    quantity.times do
      items << title
    end
  end

  def apply_discount
    self.total*=((100-self.discount)*0.01)
    self.total = self.total.round
    self.discount != 0 ? "After the discount, the total comes to $#{self.total}." : "There is no discount to apply."
  end

  def void_last_transaction
    self.total-= self.last_transaction
  end
end
