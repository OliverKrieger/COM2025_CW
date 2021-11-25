class AddUserToCampaign < ActiveRecord::Migration[5.2]
  def up
    add_reference :campaigns, :user, index: true
    Campaign.reset_column_information
    user = User.first

    Campaign.all.each do |campaign|
      campaigns.user_id = user.id
      campaigns.save!
    end

    change_column_null :campaigns, :user_id, false
    add_foreign_key :campaigns, :users
  end

  def down
    remove_foreign_key :campaigns, :users
    remove_reference :campaigns, :user, index: true
  end
end
