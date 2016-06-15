defmodule Judge.Buckets do
  use GenServer
  @moduledoc """
    It's possible to create many rule and categorized them.
    This module manage creation, deletion, and find bunch of rule(Judge.Knowledge)
  """

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @doc """
   Lookup knowledge pid for name stored in `server`
  """
  def lookup(buckets, name) do
    GenServer.call(buckets, {:lookup, name})
  end

  def create(buckets, name) do
    GenServer.call(buckets, {:create, name})
  end

  def handle_call({:create, name}, _from, knowledges) do
    if Map.has_key?(knowledges, name) do
      {:reply, knowledges, knowledges}
    else
      {:ok, knowledge } = Judge.Knowledge.start_link(name)
      result = Map.put(knowledges, name, knowledge)
      {:reply, result, result }
    end
  end

  def handle_call({:lookup, name}, _from, knowledges) do
    { :reply, Map.fetch(knowledges, name), knowledges }
  end
end
