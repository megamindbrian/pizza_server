class PizzasController < ApplicationController
  def index
    DomainFun[:get_pizzas].run do |pizzas|
      render json: pizzas
    end
  end

  def create
    DomainFun[:create_pizza].run(pizza: pizza_params) do |pizza|
      render json: pizza[:result]
    end
  end

  private

  def pizza_params
    params.require(:pizza).permit(:name, :description, :toppings => [])
  end
end
