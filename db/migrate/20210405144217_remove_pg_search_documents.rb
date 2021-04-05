class RemovePgSearchDocuments < ActiveRecord::Migration[6.0]
  def down
    drop_table :pg_search_documents
  end
end
