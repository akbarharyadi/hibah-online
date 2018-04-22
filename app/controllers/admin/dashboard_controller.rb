module Admin
  class DashboardController < Admin::ApplicationController
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
    def index
      @users = smart_listing_create(:users, Ahoy::Event.order('id desc').all, partial: "admin/dashboard/listing_visit")
    end
  end
end
