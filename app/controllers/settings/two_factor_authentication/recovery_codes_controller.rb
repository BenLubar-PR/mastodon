# frozen_string_literal: true

module Settings
  module TwoFactorAuthentication
    class RecoveryCodesController < BaseController
      def create
        @recovery_codes = current_user.generate_otp_backup_codes!
        current_user.save!
        flash[:notice] = I18n.t('two_factor_authentication.recovery_codes_regenerated')
        render :index
      end
    end
  end
end
