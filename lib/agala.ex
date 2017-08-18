defmodule Agala do
  use Application
  require Logger

  @moduledoc """
  Main framework module. Basic `Application`. Should be started as external application
  in your `mix.exs` file in order to use **Agala**.
  """

  @doc """
  Main function, starts the supervision tree
  """
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Logger.debug("Starting Agala server")
    # We are starting only registry. All bots can be started by user in there applications.
    children = [
      supervisor(Registry, [:unique, Agala.Registry])
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Function in the global scope. Starts the navigation process of the response. Calling this universal
  function will send response to every existing bot.

  Handler's response is automaticly casted to this function.

  ## Params
    * `conn` - connection with populated `Agala.Conn.Response`.
  """
  @spec response_with(conn :: Agala.Conn.t) :: :ok
  defdelegate response_with(conn), to: Agala.Bot.Responser, as: :response

  ### LetItCrashAgent
  defdelegate set(bot_params, key, value), to: Agala.Bot.LetItCrash
  defdelegate get(bot_params, key), to: Agala.Bot.LetItCrash
end
