require 'spec_helper'

describe Portfolio do

  def reset_portfolio(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @portfolio.destroy! if @portfolio
    @portfolio = Portfolio.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_portfolio
  end

  context "validations" do
    
    it "rejects empty title" do
      Portfolio.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_portfolio
      Portfolio.new(@valid_attributes).should_not be_valid
    end
    
  end

end