Cursor.configure do |config|
  # config.default_per_page = 25
  # config.max_per_page = nil
  # config.page_method_name = :page
  config.before_param_name = :next_id
  config.after_param_name = :prev_id
end
