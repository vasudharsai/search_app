class OrganizationsController < ApplicationController

  def index
    begin
      @organizations = Organization.get_result(params[:select_attribute], params[:q].try(:strip)).paginate(page: params[:page])
    rescue Exception => e
      flash.now[:notice] = e
    end
    @attributes = Organization.get_attributes
    flash.now[:notice] ||= "Search results count: #{@organizations.size}" if params[:select_attribute]
  end

end

