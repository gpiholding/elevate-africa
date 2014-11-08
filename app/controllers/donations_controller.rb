class DonationsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @donations = @campaign.donations
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.build
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.build(donation_params)
    if @donation.save
      redirect_to @campaign
    else
      render "new"
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.find(params[:id])
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.find(params[:id])
    @donation.destroy
    redirect_to campaign_path
  end

  private
    def donation_params
      params.require(:donation).permit(:name, :amount)
    end
end
