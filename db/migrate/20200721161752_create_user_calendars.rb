class CreateUserCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :user_calendars do |t|
      t.references :user, foreign_key: true
      t.date :calendar_date

      t.timestamps
    end
  end
end
