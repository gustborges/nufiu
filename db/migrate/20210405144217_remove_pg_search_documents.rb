class RemovePgSearchDocuments < ActiveRecord::Migration[6.0]
  def change
    drop_table :pg_search_documents
  end
end
