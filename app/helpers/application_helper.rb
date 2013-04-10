module ApplicationHelper
  def ten_to_one_options(default)
    options_from_collection_for_select (1..10).to_a.reverse, :to_s, :to_s, default
  end
end
