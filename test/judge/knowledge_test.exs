defmodule Judge.KnowledgeTest do
  require IEx
  use ExUnit.Case, async: true
  doctest Judge

  test "add/2" do
    {:ok, pid } = Judge.Knowledge.start_link
    rule = %{
      decisions: %{name: "judge", age: 20},
      conditions: [
        %{type: "simple", operator: "is_equal_to", value: "20", param: :amount}
      ]
    }
    assert Judge.Knowledge.add(pid, rule) == { :ok }
    assert Judge.Knowledge.add(pid, rule) == { :ok }
    assert Judge.Knowledge.list(pid) == [rule, rule]
  end

  test "evaluate/2" do
    rule = %{
      decisions: %{name: "judge", age: 21},
      conditions: [
        %{type: "simple", operator: "is_equal_to", value: 20, param: :amount}
      ]
    }
    # when there is only one rule and passed
    {:ok, pid } = Judge.Knowledge.start_link
    Judge.Knowledge.add(pid, rule)
    evidence = %{ amount: 20 }
    assert Judge.Knowledge.evaluate(pid, evidence) == rule[:decisions]

    # when there is more than 1 rule, choose the correct one
    rule2 = %{
      decisions: %{name: "judge", age: 22},
      conditions: [
        %{type: "simple", operator: "bigger_than", value: 22, param: :amount}
      ]
    }

    Judge.Knowledge.add(pid, rule2)
    assert Judge.Knowledge.evaluate(pid, evidence) == rule[:decisions]

    # when there is more than 1 rule and chosen rule > 1. choose the latest
    rule3 = %{
      decisions: %{name: "judge", age: 23},
      conditions: [
        %{type: "simple", operator: "less_than", value: 22, param: :amount}
      ]
    }

    Judge.Knowledge.add(pid, rule3)
    assert Judge.Knowledge.evaluate(pid, evidence) == rule3[:decisions]

    # when no match anything
    evidence = %{ amount: 22 }
    assert Judge.Knowledge.evaluate(pid, evidence) == %{}
  end
end
