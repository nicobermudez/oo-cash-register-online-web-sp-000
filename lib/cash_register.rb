class CashRegister
  attr_accessor :total, :discount, :quantity, :title, :price, :last_transaction, :shopping_cart


  def initialize(discount = 0)
    @total=0
    @discount=discount
    @shopping_cart = []
  end

  def add_item(title, price, quantity=1)
    @total+=(price*quantity)
    @last_transaction = price*quantity
    if quantity == 1
      @shopping_cart << title
    else
      until quantity == 0
        @shopping_cart << title
        quantity-=1
      end
    end
  end

  def apply_discount
    @total*=((100-@discount)*0.01)
    @total = @total.round
    @discount != 0 ? "After the discount, the total comes to $#{@total}." : "There is no discount to apply."
  end

  def items
    @shopping_cart
  end

  def void_last_transaction
    @total-= @last_transaction
  end
end
