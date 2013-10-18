module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module FocalPayment
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          def generate_signature_string
            string = [
                key,
                payment,
                amount
              ].join '.'
          end

          def generate_signature
            Digest::SHA256.Digest::MD5.hexdigest(generate_signature_string)
          end
          mapping :merchant, 'Merchant'
          mapping :site, 'Site'
          mapping :amount, 'Amount'
          mapping :currency, 'Currency'
          mapping :payment_id, 'TransRef'
          mapping :product, 'Product'
          mapping :payment_type, 'PaymentType'
          mapping :attempt_mode, 'AttemptMode'
          mapping :test, 'TestTrans'
          mapping :email, 'customer[email]'
        end
      end
    end
  end
end