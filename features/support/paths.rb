module NavigationHelpers
  module Refinery
    module Portfolios
      def path_to(page_name)
        case page_name
        when /the list of portfolios/
          admin_portfolios_path

         when /the new portfolio form/
          new_admin_portfolio_path
        else
          nil
        end
      end
    end
  end
end
