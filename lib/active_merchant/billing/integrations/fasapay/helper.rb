module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Fasapay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          mapping :account, 'fp_acc'
          mapping :amount, 'fp_amnt'
          mapping :account_name, 'fp_store'
          mapping :description, 'fp_item'
          mapping :currency, 'fp_currency'
          mapping :transaction_type, 'fp_fee_mode'
          mapping :success_url, 'fp_success_url'
          mapping :success_method, 'fp_success_method'
          mapping :fail_url, 'fp_fail_url'
          mapping :fail_method, 'fp_fail_method'
          mapping :order_id, 'fp_merchant_ref'
        end
      end
    end
  end
end