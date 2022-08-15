# frozen_string_literal: true

module Api
  module V1
    module Admin
      class SiteSettingsController < ApiController
        def index
          site_settings = Setting.joins(:site_settings)
                                 .where(site_settings: { provider: 'greenlight' })
                                 .pluck(:name, :value)
                                 .to_h

          render_data data: site_settings, status: :ok
        end

        def update
          site_setting = SiteSetting.joins(:setting)
                                    .find_by(
                                      provider: 'greenlight',
                                      setting: { name: params[:name] }
                                    )
          return render_error status: :not_found unless site_setting

          update = if params[:name] == 'BrandingImage'
                     site_setting.image.attach params[:site_setting][:value]
                   else
                     site_setting.update(value: params[:site_setting][:value].to_s)
                   end

          return render_error status: :bad_request unless update

          render_data status: :ok
        end
      end
    end
  end
end
