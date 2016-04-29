class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:collection,:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.order('created_at ASC').page(params[:page]).per(9)
  end

  #POST "products/search/", to: "products#search"
  def search
    @products = Product.search(params[:query], fields: [:name])
    respond_to do |format|
      format.html { render :index }
    end
  end

  def autocomplete
    respond_to do |format|
      format.html
      format.js

      format.json {
        render json: Product.search(params[:query], {
            fields: ["name"],
            limit: 10,
            load: false,
            misspellings: {below: 1}
        }).map(&:name)
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order
    @product = Product.find(params[:product_id])

    @categories = Category.all
    @new_arrivals = Product.new_arrival
    @best_sellers = Product.best_seller

    @order = Order.create(quantity: params[:quantity], user_id: params[:user_id])

    @order.products << @product
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_products
    @products = Product.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :about, :price, :image)
  end
end
