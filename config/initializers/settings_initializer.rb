if ActiveRecord::Base.connection.table_exists? 'settings'
   Setting["Rescue Threshold"] = 1.0
end