class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  # Ensure the user before he 0r she create is Authenticated
  before_action :authenticate_account!, only: [:index, :show]
  # show side bar
  before_action :set_sidebar, except: [:show]
  # User To edit , delete his or her own post
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @agent = @property.account
  end

  # GET /properties/new
  def new
    # @property = Property.new
    @property = current_account.properties.build
 
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    # @property = Property.new(property_params)
    # @property.account_id = current_account.id
    @property = current_account.properties.build(property_params)


    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # correct user to update , delete
    def correct_user
      @property = current_account.properties.find_by(id: params[:id])
      redirect_to property_path, notice: "Not Authorized" if @property.nil?
    end
    
    # show sidebar
    def set_sidebar
      @show_sidebar = true
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :parking_spaces, :photo, :photo_cache)
    end
end
