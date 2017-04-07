require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Mypay
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          %w(
            id
            account
            clientID
            currency
            date
            error
            errorMessage
            parameters
            paymentType
            price
            revenue
            serviceID
            status
            timestamp
            unitName
            hash
          ).each do |param_name|
            define_method(param_name.underscore){ params[param_name] }
          end

          def acknowledge(authcode = nil)
            string = [
              account,
              clientID,
              currency,
              date,
              id,
              orderId,
              error,
              errorMessage,
              parameters,
              paymentType,
              price,
              revenue,
              serviceID,
              status,
              timestamp,
              unitName,
              @options[:secret]
            ].join('')
            signature = Digest::SHA1.hexdigest(string)
            signature == hash
          end

        end
      end
    end
  end
end