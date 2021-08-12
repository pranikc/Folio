class RecommendationsController < ApplicationController
  after_action :apply_content_range_header

  def index
    @recommendations = Recommendation.all
    render json: @recommendations
  end

  def show
    @recommendations = Recommendation.find_by(id: params[:id])
    render json: @recommendations
  end

  def create
    new_recommendation = Recommendation.new(user_id: params[:user_id], company_id: params[:company_id], rating: params[:rating], comment: params[:comment])

    if new_recommendation.save
      redirect_to recommendations_path
    end
  end

  def update
    updating_rec = Recommendation.find(params[:id])

    if updating_rec.update(user_id: params[:user_id], company_id: params[:company_id], rating: params[:rating], comment: params[:comment])
      redirect_to recommendations_path
    end
  end

  protected
  def apply_content_range_header
    response.headers['Content-Range'] = Recommendation.all.length
  end
end
