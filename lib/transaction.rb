class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    @id = @@transactions.length + 1
    @customer = customer
    @product = product
    process_transaction
  end

  def self.all
    @@transactions
  end

# Search a transaction by id
  def self.find(id)
    @@transactions.find {|transaction| transaction.id == id}
  end

# Process transaction
  def process_transaction
    if product.in_stock?
      @@transactions << self
      product.purchase
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end

end
