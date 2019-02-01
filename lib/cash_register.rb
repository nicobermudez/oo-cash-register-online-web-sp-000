class CashRegister
  attr_accessor :total, :discount, :quantity, :title, :price, :last_transaction, :shopping_cart


  def initialize(discount = 0)
    @total=0
    @discount=discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total+=(price*quantity)
    @last_transaction = price*quantity
    quantity.times do
      items << title
    end
  end

  def apply_discount
    @total*=((100-@discount)*0.01)
    @total = @total.round
    @discount != 0 ? "After the discount, the total comes to $#{@total}." : "There is no discount to apply."
  end



  def void_last_transaction
    @total-= @last_transaction
  end
end
