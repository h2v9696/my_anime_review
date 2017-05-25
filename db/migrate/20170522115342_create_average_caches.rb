class CreateAverageCaches < ActiveRecord::Migration
  class  << self
    def up
      create_table :average_caches do |t|
        t.belongs_to :rater
        t.belongs_to :rateable, polymorphic: true
        t.float :avg, null: false
        t.timestamps
      end
    end

    def down
      drop_table :average_caches
    end
  end
end

