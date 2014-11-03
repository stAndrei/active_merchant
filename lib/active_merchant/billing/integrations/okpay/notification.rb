require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Okpay
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          def order_id
            params['ok_txn_id']
          end

          def amount
            params['ok_txn_gross']
          end

          def acknowledge
            true
          end

        end
      end
    end
  end
end
