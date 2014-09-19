require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Ecommpay
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          %w(
            payment_type_id
            transaction_id
            external_id
            site_id
            order_description
            currency
            real_amount
            real_currency
            language
            type
            signature
          ).each do |param_name|
            define_method(param_name.underscore){ params[param_name] }
          end

          alias_method :order, :external_id

          def amount
            params['amount'].to_i / 100.0
          end

          def acknowledge
            signature == generate_signature
          end

          def generate_signature_string
            params.map{|k, v| "#{k}:#{v}" }.sort.push(@options[:secret]).join(';')
          end

          def generate_signature
            Digest::SHA1.hexdigest(generate_signature_string)
          end

        end
      end
    end
  end
end
