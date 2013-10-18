require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Fasapay
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          %w(TransID
            TransRef
            Amount
            Currency
            Status
            Message
            Email
            Key
            Test
            RebillId
            ).each do |param_name|
              define_method(param_name.underscore){ params[param_name] }
            end

            alias_method :key, :Key
            alias_method :payment, :RebillId
            alias_method :amount, :Amount

            def security_key
              params["Key"]
            end

            def item_id
              params['RebillId']
            end

          def acknowledge
            security_key == generate_signature
          end

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

        end
      end
    end
  end
end
