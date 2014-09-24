class CampaignsController < ApplicationController
  before_action :authenticate_user!, :except => :api_index
  load_and_authorize_resource only: [:show, :edit, :update, :destroy]
  before_action :check_associated_resources

  # GET /campaigns
  def index
    @campaigns = Campaign.all
    @campaigns = @campaigns.where(advertiser_id: current_user.advertiser_ids) unless current_user.administrator?
  end

  # GET /campaigns/1
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to [@user, @advertiser, @campaign], notice: 'Campaign was successfully created.' }
      else
        format.html { render [:new, @user, @advertiser, :campaign] }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to [@user, @advertiser, @campaign], notice: 'Campaign was successfully updated.' }
      else
        format.html { render [:edit, @user, @advertiser, @campaign] }
      end
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @advertiser, campaigns], notice: 'Campaign was successfully destroyed.' }
    end
  end

  # API methods
  # api/campaigns (all campaigns)
  # api/campaigns/active (all active campaigns)
  # api/:country/campaigns (campaigns in country)
  # api/:country/campaigns/active (active campaigns in country)
  def api_index
    campaigns = Campaign.all
    campaigns = campaigns.for_country(params[:country].presence) if params[:country]
    campaigns = campaigns.active if 'active' == params[:status]
    respond_to do |format|
      format.json { render json: campaigns }
    end
  end

  private
    def check_associated_resources
      @user = current_user if current_user && !current_user.administrator?
      ad = params[:advertiser_id] || @campaign.try(:advertiser_id)
      @advertiser = Advertiser.find_by_id(ad)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params[:campaign].permit(:name, :budget, :start_date, :end_date, :in_pause, :link, :country_code, :creative, :advertiser_id)
    end
end
