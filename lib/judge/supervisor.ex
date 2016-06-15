defmodule Judge.Supervisor do
  use Supervisor

  @name Judge.Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def init(:ok) do

    children = [
      worker(Judge.Buckets,[])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
