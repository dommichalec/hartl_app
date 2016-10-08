# rails generate migration AddIndexToUsers email:index
# add index when expecting to retrieve a record by the indexed attribute
# in this case, the email


class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :email, unique: true
  end
end

# Defining a database index improves lookup efficiency while allowing
# enforcement of uniqueness at the database level.
