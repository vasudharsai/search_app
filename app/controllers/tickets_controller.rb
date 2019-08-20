class TicketsController < ApplicationController

  def index
    begin
      @tickets = Ticket.get_result(params[:select_attribute], params[:q].try(:strip)).paginate(page: params[:page])
    rescue Exception => e
      flash.now[:notice] = e
    end
    @attributes = Ticket.get_attributes
    flash.now[:notice] ||= "Search results count: #{@tickets.size}" if params[:select_attribute]
  end

end
