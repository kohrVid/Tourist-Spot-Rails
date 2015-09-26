class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
	    t.string :question, null: false, default: ""
	    t.string :answer, null: false, default: ""

      t.timestamps null: false
    end
  end
end
