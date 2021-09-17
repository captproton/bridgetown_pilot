class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :layout
      t.string :title
      t.string :categories
      t.text :body
      t.datetime :publish_at

      t.timestamps
    end
  end
end
