Geocoder.configure(:lookup => :test)    
Geocoder::Lookup::Test.add_stub(
  "2715 Dwight Way,#22,Berkeley,CA,94704,US", [
    {
      'latitude'     => 40.714353,
      'longitude'    => -74.005973,
      'formatted_address' => '2715 Dwight Way,#22,Berkeley,CA,94704,USA',
      'state'        => 'California',
      'state_code'   => 'CA',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

Geocoder::Lookup::Test.add_stub("2715 Dwight Way,#22,aoeudghaoudgaeou,eaoudhaeoud,94704,oaehduoaedhoua", [])