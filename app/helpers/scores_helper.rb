module ScoresHelper
  def back_path
    prev_choice = choices.index(@choice) - 1
    return decision_path(@decision) if prev_choice < 0
    decision_choice_scores_path @decision, choices[prev_choice]
  end

  def choices
    @decision.choices
  end

  def next_page
    next_choice = choices.index(@choice) + 1
    return decision_path(@decision) if next_choice >= choices.length
    decision_choice_scores_path @decision, choices[next_choice]
  end
end
