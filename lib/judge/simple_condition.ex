require IEx
defmodule Judge.SimpleCondition do
  @behaviour Judge.Condition
  def execute(evidence, condition) do
    match_condition?(condition, evidence)
  end

  def match_condition?(%{ operator: "is_equal_to"} = condition, evidence) do
    evidence[condition[:param]] == condition[:value]
  end

  def match_condition?(%{ operator: "is_not_equal_to" } = condition, evidence) do
    evidence[condition[:param]] != condition[:value]
  end

  def match_condition?(%{ operator: "less_than" } = condition, evidence) do
    evidence[condition[:param]] < condition[:value]
  end

  def match_condition?(%{ operator: "bigger_than" } = condition, evidence) do
    evidence[condition[:param]] > condition[:value]
  end

  def match_condition?(%{ operator: "bigger_than_or_equal_to" } = condition, evidence) do
    evidence[condition[:param]] >= condition[:value]
  end

  def match_condition?(%{ operator: "less_than_or_equal_to" } = condition, evidence) do
    evidence[condition[:param]] <= condition[:value]
  end
end
