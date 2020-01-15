class Api::ProductsController < ApplicationController

  def all_products
    @all_products = Product.all
    render "all_products.json.jb"
  end

  def budget_products
    budget_picks = []
    index = 0

    while index < Product.all.length
      if Product.all[index].price < 110
        budget_picks << Product.all[index]
      end
      index += 1
    end

    @budget_products = budget_picks

    render "budget_products.json.jb"
  end

  def high_end_products
    high_end_picks = []
    index = 0

    while index < Product.all.length
      if Product.all[index].price > 110
        high_end_picks << Product.all[index]
      end
      index += 1
    end

    @high_end_products = high_end_picks

    render "high_end_products.json.jb"
  end

end
