module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Interkassa
        class Helper < ActiveMerchant::Billing::Integrations::Helper

          mapping :account, 'ik_shop_id'
          mapping :amount, 'ik_payment_amount'
          mapping :description, 'ik_payment_desc'
          mapping :paysystem_alias, 'ik_paysystem_alias'
          mapping :success_url, 'ik_success_url'
          mapping :success_method, 'ik_success_method'
          mapping :fail_url, 'ik_fail_url'
          mapping :fail_method, 'ik_fail_method'
          mapping :status_url, 'ik_status_url'
          mapping :status_method, 'ik_status_method'
          mapping :order, 'ik_payment_id'

        end
      end
    end
  end
end