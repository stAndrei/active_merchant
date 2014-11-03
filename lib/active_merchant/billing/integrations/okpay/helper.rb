module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Okpay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          mapping :account, 'ok_receiver'
          mapping :amount, 'ok_item_1_price'
          mapping :currency, 'ok_currency'
          mapping :order, 'ok_invoice'
          mapping :description, 'ok_item_1_name'
        end
      end
    end
  end
end