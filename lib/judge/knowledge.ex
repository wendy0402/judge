defmodule Judge.Knowledge do
  @moduledoc """
  GenServer to hold all authorization information related with role
  """
  use GenServer
  @prefix "Judge"

  @doc """
  Start our queue and link it.  This is a helper method
  """
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    {:ok, state }
  end

  @doc """
  Add new rule to process.
  format: [
    decisions: [name: 'judge', age: 20],
    conditions: [type: 'simple', operator: 'is_equal_to', value: '20', param: 'amount']
  ]
  """
  def add(pid, rule) do
    add_action({ :ok }, pid, Map.new(rule))
  end

  @doc """
  Return all stored rules in the process
  """
  def list(pid) do
    GenServer.call(pid, :list)
  end

  def handle_call({:add, new_rule}, _from, current_rules) do
    { :reply, {:ok}, [new_rule | current_rules] }
  end

  def handle_call(:list, _from, current_rules) do
    { :reply, current_rules, current_rules }
  end

  defp add_action({:ok}, pid, rule) do
    GenServer.call(pid, {:add, rule})
  end

  defp add_action({:error, message: message}, _pid, _rule) do
    { :error, message: message }
  end
end
