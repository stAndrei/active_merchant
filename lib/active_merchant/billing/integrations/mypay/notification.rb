require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Mypay
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          %w(
            clientid
            account
            priceid
            serviceid
            amount
            lang
            successurl
            failureurl
            params
            orderid
          ).each do |param_name|
            define_method(param_name.underscore){ params[param_name] }
          end

          def acknowledge(authcode = nil)
            true
          end
          
        end
      end
    end
  end
end