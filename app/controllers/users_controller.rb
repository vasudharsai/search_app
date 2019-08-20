class UsersController < ApplicationController

  def index
    begin
      @users = User.get_result(params[:select_attribute], params[:q].try(:strip)).paginate(page: params[:page])
    rescue Exception => e
      flash.now[:notice] = e
    end
    @attributes = User.get_attributes
    flash.now[:notice] = "Search results count: #{@users.size}" if params[:select_attribute]
  end

end
