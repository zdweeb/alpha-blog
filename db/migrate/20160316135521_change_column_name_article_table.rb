class ChangeColumnNameArticleTable < ActiveRecord::Migration
  def change
    rename_column :articles, :updates_at, :updated_at
  end
end
