class Product
  attr_reader :title, :stock, :price

  public

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @stock = options[:stock]
    @price = options[:price]
    add_to_products
  end

  def self.all
    @@products
  end

# Search a product by title
  def self.find_by_title(title)
    @@products.find {|product| product.title == title}
  end

# Array of all products with a stock greater than zero
  def self.in_stock
    @@products.select {|product| product.in_stock?}
  end

# See if a product has stock
  def in_stock?
    @stock > 0
  end

# Reducing stock for a purchase
  def purchase
    @stock -= 1
  end

  private

# Add a product only if doesn't exist
  def add_to_products
    if @@products.to_s.include? @title
      raise DuplicateProductError, "'#{title}' already exists."
    else
      @@products << self
    end
  end
end
