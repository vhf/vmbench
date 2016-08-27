defmodule CowboyElixir do
  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
      { :_,
        [
          {"/[:number]", DynamicPageHandler, []}
      ]}
    ])
    { :ok, _ } = :cowboy.start_http(:http,
                                    1000,
                                   [{:port, 25000}],
                                   [{ :env, [{:dispatch, dispatch}]}]
                                   )
  end
end
