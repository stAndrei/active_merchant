require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Epayservice
        class Notification < ActiveMerchant::Billing::Integrations::Notification
              %w(
                  eps_request 
                  eps_trid 
                  eps_accnum 
                  eps_company 
                  eps_guid 
                  eps_amount 
                  eps_currency 
                  eps_description
                  check_key
                ).each do |param_name|
                define_method(param_name){ params[param_name.upcase] }
              end

          alias_method :amount, :eps_amount
          alias_method :hash, :check_key

          def acknowledge
            hash == generate_signature
          end


          def generate_signature_string
            amount + eps_guid + @options[:secret]
          end

          def generate_signature
            Digest::MD5.hexdigest(generate_signature_string).downcase
          end
          
        end
      end
    end
  end
end
