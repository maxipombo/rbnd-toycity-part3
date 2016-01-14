class Customer
  attr_reader :name

  public

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

# Search a customer by name
  def self.find_by_name(name)
    @@customers.find {|product| product.name == name}
  end

# Customer purchase a product
  def purchase(product)
    Transaction.new(self, product)
  end

  private

# Add a customer only if doesn't exist
  def add_to_customers
    if @@customers.to_s.include? @name
      raise DuplicateCustomerError, "'#{name}' already exists."
    else
      @@customers << self
    end
  end
end
