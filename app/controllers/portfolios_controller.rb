class PortfoliosController < ApplicationController

  before_filter :find_all_portfolios
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @portfolio in the line below:
    present(@page)
  end

  def show
    @portfolio = Portfolio.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @portfolio in the line below:
    present(@page)
  end

protected

  def find_all_portfolios
    @portfolios = Portfolio.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/portfolios").first
  end

end
