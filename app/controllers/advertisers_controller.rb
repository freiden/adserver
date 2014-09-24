class AdvertisersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource only: [:show, :edit, :update, :destroy]
  before_action :check_associated_resources

  def index
    @advertisers = Advertiser.all
    @advertisers = @advertisers.where(user_id: current_user.id) unless current_user.administrator?
  end

  def show
  end

  # GET /advertisers/new
  def new
    @advertiser = Advertiser.new
  end

  # GET /advertisers/1/edit
  def edit
  end

  def create
    @advertiser = Advertiser.new(advertiser_params)

    respond_to do |format|
      if @advertiser.save
        format.html { redirect_to [@user, @advertiser], notice: 'Advertiser was successfully created.' }
      else
        format.html { render [:new, @user, :advertiser]}
      end
    end
  end

  def update
    respond_to do |format|
      if @advertiser.update(advertiser_params)
        format.html { redirect_to [@user, @advertiser], notice: 'Advertiser was successfully updated.' }
      else
        format.html { render [:edit, @user, @advertiser] }
      end
    end
  end

  def destroy
    @advertiser.destroy
    respond_to do |format|
      format.html { redirect_to [@user, :advertisers], notice: 'Advertiser was successfully destroyed.' }
    end
  end

  private
    def check_associated_resources
      @user = current_user if current_user && !current_user.administrator?
    end

    # # Use callbacks to share common setup or constraints between actions.
    # def set_advertiser
    #   @advertiser = Advertiser.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertiser_params
      params[:advertiser].permit(:company, :first_name, :last_name, :email, :address, :city, :postcode, :country_code, :user_id)
    end
end
