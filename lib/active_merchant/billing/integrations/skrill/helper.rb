module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Skrill
        class Helper < ActiveMerchant::Billing::Integrations::Helper

          mapping :order, 'transaction_id'
          mapping :account, 'pay_to_email'

        end
      end
    end
  end
end