Rails.application.config.i18n.available_locales = [:ja, :en]
Rails.application.config.i18n.default_locale = :ja

# config/locales 以下すべてのファイルを読み込む
Rails.application.config.i18n.load_path += Dir[
  Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
