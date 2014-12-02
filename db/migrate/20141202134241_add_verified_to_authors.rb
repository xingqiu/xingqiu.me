class AddVerifiedToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :verified, :boolean
  end
end
