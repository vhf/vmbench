defmodule DynamicPageHandler do
  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(request, state) do
    {param, request} = :cowboy_req.binding(:number, request)
    msize = case param do
       :undefined -> 1024
       _ -> String.to_integer(param)
    end
    { :ok, reply } = :cowboy_req.reply(
      200,
      [],
      String.duplicate("X", msize),
      request
    )
    {:ok, reply, state}
  end

  def terminate(reason, request, state) do
    :ok
  end
end
