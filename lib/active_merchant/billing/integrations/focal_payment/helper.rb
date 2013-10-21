module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module FocalPayment
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          def generate_signature_string
            string = "#{@options[:secret]}#{transaction}#{amount}"
          end

          def generate_signature
            Digest::SHA256.Digest::MD5.hexdigest(generate_signature_string)
          end
          mapping :account, 'Merchant'
          mapping :site, 'Site'
          mapping :transaction, 'TransId'
          mapping :amount, 'Amount'
          mapping :currency, 'Currency'
          mapping :order, 'TransRef'
          mapping :product, 'Product'
          mapping :payment_type, 'PaymentType'
          mapping :attempt_mode, 'AttemptMode'
          mapping :test, 'TestTrans'
          mapping :email, 'customer[email]'
          mapping :first_name, 'customer[first_name]'
          mapping :last_name, 'customer[last_name]'
        end
      end
    end
  end
end