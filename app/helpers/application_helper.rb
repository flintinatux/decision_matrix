module ApplicationHelper
  def submit_form
    "$(this).closest('form').submit(); return false;"
  end
  
  def ten_to_one_options(default)
    collection = ['--'] + (1..10).to_a.reverse
    options_from_collection_for_select collection, :to_s, :to_s, default
  end
end
