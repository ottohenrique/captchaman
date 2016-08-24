class CreateCaptchas < ActiveRecord::Migration[5.0]
  def change
    create_table :captchas do |t|
      t.string :image_uid
      t.string :code
      t.string :external_id

      t.timestamps
    end
  end
end
