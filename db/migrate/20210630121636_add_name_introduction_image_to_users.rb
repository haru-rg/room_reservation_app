class AddNameIntroductionImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string #追記
    add_column :users, :introduction, :text #追記
    add_column :users, :image, :string #追記
  end
end
