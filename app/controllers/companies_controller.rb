class CompaniesController < ApplicationController
  after_action :apply_content_range_header

  def index
    @companies = Company.all
    render json: @companies
  end

  def show
    @company = Company.find_by(id: params[:id])
    render json: @company
  end

  def create
    new_company = Company.new(name: params[:name], board_members: params[:board_members], year: params[:year], industry: params[:industry])

    if new_company.save
      redirect_to companies_path
    end
  end

  def update
    updating_company = Company.find(params[:id])

    if updating_company.update(name: params[:name], board_members: params[:board_members], year: params[:year], industry: params[:industry])
      redirect_to companies_path
    end
  end

  def destroy
    deleting_company = Company.find(params[:id])

    deleting_company.delete
    redirect_to companies_path
  end

  protected
  def apply_content_range_header
    response.headers['Content-Range'] = Company.all.length
  end
end
