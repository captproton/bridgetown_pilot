class CreateGitRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :git_repos do |t|
      t.string :email
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
