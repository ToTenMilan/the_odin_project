# Exercise 13.4.3.2 - but the tests gone well even without this config, which is suspicious
if Rails.env.test?
  CarrierWave.configure do |config|
    config.enable_processing = false
  end
end
