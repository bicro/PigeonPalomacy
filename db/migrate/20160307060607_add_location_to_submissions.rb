class AddLocationToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :latitude, :float
    add_column :submissions, :longitude, :float
    add_column :submissions, :ip, :string
  end
end
