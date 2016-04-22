Geocoder.configure(:timeout => 20)
Geocoder.configure(ip_lookup: :maxmind_local, maxmind_local: {file: File.join(Rails.root, 'public', 'geodbs', 'GeoLiteCity.dat')})