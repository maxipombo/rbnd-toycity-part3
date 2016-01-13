class Product
  attr_reader :title

  public

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    if @@products.to_s.include? @title
      raise DuplicateProductError, "'#{title}' already exists."
    else
      @@products << self
    end
  end
end
