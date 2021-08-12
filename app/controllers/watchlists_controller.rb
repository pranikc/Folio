class WatchlistsController < ApplicationController
  after_action :apply_content_range_header

  def index
    @watchlists = Watchlist.all
    render json: @watchlists
  end

  def show
    @watchlist = Watchlist.find_by(id: params[:id])
    puts @watchlist
    render json: @watchlist
  end

  def create
    new_watchlist = Watchlist.new(user_id: params[:user_id], company_id: params[:company_id])

    if new_watchlist.save
      redirect_to watchlists_path
    end
  end

  def destroy
    deleting_watchlist = Watchlist.find(params[:id])

    deleting_watchlist.delete
    redirect_to watchlists_path
  end

  protected
  def apply_content_range_header
    response.headers['Content-Range'] = Watchlist.all.length
  end
end
