module Admin
  class PortfoliosController < Admin::BaseController

    crudify :portfolio, :xhr_paging => true

  end
end
