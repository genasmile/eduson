class CreateBasicTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :pass
      t.string :fio
      t.integer :permission, default: 100
      t.boolean :active, defalt: true
      t.timestamps
    end

    create_table :courses do |t|
      t.string :title
      t.string :desc
    end

    create_table :tests do |t|
      t.string :title
      t.string :desc
      t.integer :mark_max
      t.integer :duration
    end

    create_table :user_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :passed, default: false
      t.timestamps
    end

    create_table :user_tests do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :mark
      t.boolean :passed, default: false
      t.timestamps
    end
  end
end