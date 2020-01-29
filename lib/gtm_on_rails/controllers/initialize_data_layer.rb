module GtmOnRails
  module Controllers
    module InitializeDataLayer
      extend ActiveSupport::Concern

      included do
        before_action :initialize_data_layer
        helper_method :data_layer
      end

      def data_layer
        @gtm_on_rails_data_layer
      end
      
      private
        def initialize_data_layer
          @gtm_on_rails_data_layer = GtmOnRails::DataLayer.new

          if GtmOnRails.config.send_controller_and_action_in_data_layer
            @gtm_on_rails_data_layer.push({
              rails_controller: controller_name,
              rails_action:     action_name
            })
          end
        end
    end
  end
end
