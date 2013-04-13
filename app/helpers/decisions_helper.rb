module DecisionsHelper
  extend Forwardable
  def_delegators :@decision, :choices, :criteria, :scores

  def enough_choices?
    choices.count >= 2
  end

  def enough_criteria?
    criteria.count >= 1
  end

  def ok_if(completed)
    render 'shared/checkmark_if_ok', ok: completed
  end

  def scores_completed?
    scores.count > 0 &&
    scores.count == choices.count * criteria.count
  end

  def scores_enabled?
    enough_choices? && enough_criteria?
  end
end
