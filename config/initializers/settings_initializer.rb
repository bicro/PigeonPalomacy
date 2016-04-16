if ActiveRecord::Base.connection.table_exists? 'settings'
   Setting["Hurt Threshold"] = 1.0
end