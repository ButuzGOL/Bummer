class AddCommentsCounterForDiscussion < ActiveRecord::Migration
  def up
    add_column :discussions, :comments_count, :integer, default: 0

    Discussion.reset_column_information
    Discussion.find(:all).each do |p|
      Discussion.update_counters p.id, comments_count: p.comments.length
    end
  end

  def down
    remove_column :discussions, :comments_count
  end
end
