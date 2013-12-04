require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Interkassa
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          %w(
            ik_shop_id
            ik_payment_id
            ik_baggage_fields
            ik_trans_id
            ik_fees_payer
            ik_payment_desc
            ik_payment_amount
            ik_paysystem_alias
            ik_payment_state
            ik_payment_timestamp
            ik_currency_exch
            ik_sign_hash
          ).each do |param_name|
            define_method(param_name.underscore){ params[param_name] }
          end

          alias_method :account, :ik_shop_id
          alias_method :payment_id, :ik_payment_id
          alias_method :baggage_fields, :ik_baggage_fields
          alias_method :trans_id, :ik_trans_id
          alias_method :fees, :ik_fees_payer
          alias_method :description, :ik_payment_desc
          alias_method :amount, :ik_payment_amount
          alias_method :paysystem_alias, :ik_paysystem_alias
          alias_method :state, :ik_payment_state
          alias_method :payment_time, :ik_payment_timestamp
          alias_method :currency_exchange, :ik_currency_exch
          alias_method :hash, :ik_sign_hash

          def acknowledge
            hash == generate_signature
          end

          def generate_signature_string
            string = [
                account,
                amount,
                payment_id,
                paysystem_alias,
                baggage_fields,
                state,
                trans_id,
                currency_exchange,
                fees,
                @options[:secret]
              ].join ':'
          end

          def generate_signature
            Digest::MD5.hexdigest(generate_signature_string).upcase
          end

        end
      end
    end
  end
end