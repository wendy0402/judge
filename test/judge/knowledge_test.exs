defmodule Judge.KnowledgeTest do
  use ExUnit.Case, async: true
  doctest Judge

  test "add rule" do
    {:ok, pid } = Judge.Knowledge.start_link
    rule = %{
      decisions: %{name: 'judge', age: 20},
      conditions: %{type: 'simple', operator: '==', value: '20'}
    }
    assert Judge.Knowledge.add(pid, rule) == { :ok }
    assert Judge.Knowledge.add(pid, rule) == { :ok }
    assert Judge.Knowledge.list(pid) == [rule, rule]
  end
end
