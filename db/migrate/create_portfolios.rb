class CreatePortfolios < ActiveRecord::Migration

  def self.up
    create_table :portfolios do |t|
      t.string :title
      t.text :description
      t.integer :picture_id
      t.string :url
      t.integer :position

      t.timestamps
    end

    add_index :portfolios, :id

    load(Rails.root.join('db', 'seeds', 'portfolios.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "portfolios"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/portfolios"})
    end

    drop_table :portfolios
  end

end
