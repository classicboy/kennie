class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_collection]

  def show
    @products = Product.all
  end

  def add_to_collection
    product = Product.find(params[:product_id])
    if current_user.collection.products.include? product
      current_user.collection.products.delete product
    else
      current_user.collection.products << product
    end

    respond_to do |format|
      format.json { render json: { status: :ok } }
    end

  end
end