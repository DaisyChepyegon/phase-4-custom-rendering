class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, only: [:id, :name, :price, :bestseller]
    render json: cheeses, except: [:created_at, :updated_at], methodes: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methodes: [:summary]
    else
      render json: {error: 'cheese not found'}, status: :not_found
    end

  end

end
