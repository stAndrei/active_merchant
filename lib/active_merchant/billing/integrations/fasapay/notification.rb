require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Fasapay
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          %w(
            fp_paidto
            fp_paidby
            fp_amnt
            fp_fee_amnt
            fp_currency
            fp_batchnumber
            fp_item
            fp_store
            fp_timestamp
            fp_merchant_ref
          ).each do |param_name|
            define_method(param_name.underscore){ params[param_name] }
          end

          alias_method :account, :fp_paidto
          alias_method :payer, :fp_paidby
          alias_method :amount, :fp_amnt
          alias_method :fee_amount, :fp_fee_amnt
          alias_method :currency, :fp_currency
          alias_method :description, :fp_item
          alias_method :account_name, :fp_store
          alias_method :received_at, :fp_timestamp
          alias_method :order, :fp_merchant_ref

        end
      end
    end
  end
end
