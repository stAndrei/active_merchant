module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Bfopay
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          def generate_signature_string
            string = [
              account,
              pay_id,
              trade_date,
              order,
              amount,
              gateway_url,
              success_url,
              notice_type,
              @fields['Secret']
            ].join '|'
          end

          def generate_signature
            Digest::MD5.hexdigest(generate_signature_string).downcase
          end

          def form_fields
            @fields.merge('Signature' => generate_signature).except('Secret')
          end

          mapping :account, 'MemberID'
          mapping :terminal_id, 'TerminalID'
          mapping :interface_version, 'InterfaceVersion'
          mapping :key_type, 'KeyType'
          mapping :pay_id, 'PayID'
          mapping :trade_date, 'TradeDate'
          mapping :order, 'TransID'
          mapping :amount, 'OrderMoney'
          mapping :description, 'ProductName'
          mapping :gateway_url, 'PageUrl'
          mapping :success_url, 'ReturnUrl'
          mapping :notice_type, 'NoticeType'
          mapping :signature, 'Signature'
          mapping :secret, 'Secret'
        end
      end
    end
  end
end