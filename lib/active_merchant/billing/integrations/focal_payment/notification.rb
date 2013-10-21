require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module FocalPayment
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          %w(TransID
            TransRef
            Amount
            Currency
            Status
            Message
            Email
            Merchant
            TransRef
            Product
            AttemptMode
            Test
            TestTrans
            Site
            PaymentType
            customer[email]
            customer[first_name]
            customer[last_name]
            ).each do |param_name|
              define_method(param_name){ params[param_name] }
            end

            alias_method :amount, :Amount
            alias_method :transaction, 'TransId'
            alias_method :account, :Merchant
            alias_method :site, :Site
            alias_method :currency, :Currency
            alias_method :order, :TransRef
            alias_method :product, :Product
            alias_method :payment_type, :PaymentType
            alias_method :attempt_mode, :AttemptMode
            alias_method :test, :TestTrans
            alias_method :email, 'customer[email]'
            alias_method :first_name, 'customer[first_name]'
            alias_method :last_name, 'customer[last_name]'

            def secret
              @options[:secret]
            end

            def security_key
              params["Key"]
            end

            def item_id
              params['TransRef']
            end

          def acknowledge
            security_key == generate_signature
          end

          def generate_signature_string
            string = [
                key,
                transaction,
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
