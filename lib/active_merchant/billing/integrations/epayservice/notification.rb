require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Epayservice
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          
          def complete?
            true
          end 

          def acknowledge
            true
          end
          
        end
      end
    end
  end
end
