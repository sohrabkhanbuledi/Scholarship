class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :title
      t.text :body
      t.date :faq_update

      t.timestamps null: false
    end
  end
end
