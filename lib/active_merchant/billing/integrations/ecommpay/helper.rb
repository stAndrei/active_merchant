module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Ecommpay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          def generate_signature_string
            string = [
              "amount:#{amount}",
              "callback_method:#{callback_method}",
              "currency:#{currency}",
              "decline_url:#{fail_url}",
              "description:#{description}",
              "external_id:#{order}",
              "iframe:#{iframe}",
              "language:#{locale}",
              "signature:#{signature}",
              "site_id:#{account}",
              "success_url:#{success_url}",
              @options[:secret]
            ].join ';'
          end

          def generate_signature
            Digest::SHA1.hexdigest(generate_signature_string)
          end

          mapping :account, 'site_id'
          mapping :amount, 'amount'
          mapping :order, 'external_id'
          mapping :locale, 'language'
          mapping :currency, 'currency'
          mapping :iframe, 'iframe'
          mapping :description, 'description'
          mapping :success_url, 'success_url'
          mapping :fail_url, 'decline_url'
          mapping :callback_method, 'callback_method'
        end
      end
    end
  end
end