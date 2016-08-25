defmodule Echo do
  def start(_, _) do
    tcp_options = [:binary, {:packet, 0}, {:active, false}, {:nodelay, true}]
    {:ok, socket} = :gen_tcp.listen(25000, tcp_options)
    listen(socket)
  end

  defp listen(socket) do
    {:ok, conn} = :gen_tcp.accept(socket)
    spawn(fn -> recv(conn) end)
    listen(socket)
  end

  defp recv(conn) do
    case :gen_tcp.recv(conn, 0) do
      {:ok, data} ->
        :gen_tcp.send(conn, data)
        recv(conn)
      {:error, :closed} ->
        :ok
    end
  end
end
