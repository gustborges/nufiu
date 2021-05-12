class AddNewsletterSubscriptionToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :newsletter_subscription, :boolean, default: false
  end
end
