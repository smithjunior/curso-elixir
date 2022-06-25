defmodule ExMon.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  alias ExMon.PokeApi.Client

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  describe "get_pokemon/1" do
    test "when there is a pokemon with the given name, return the pokemon" do
      body = %{"name" => "pikachu", "weight" => 60, "types" => ["eletric"]}

      mock(fn %{method: :get, url: @base_url <> "pikachu"} ->
        %Tesla.Env{status: 200, body: body}
      end)

      response = Client.get_pokemon("pikachu")

      expected_response = {:ok, %{"name" => "pikachu", "types" => ["eletric"], "weight" => 60}}

      assert expected_response == response
    end

    test "when there no pokemon with the given name, return the error" do
      mock(fn %{method: :get, url: @base_url <> ""} ->
        %Tesla.Env{status: 404}
      end)

      response = Client.get_pokemon("")

      expected_response = {:error, "Pokemon not found"}

      assert expected_response == response
    end

    test "when there is an unexpected error, returns the error" do
      mock(fn %{method: :get, url: @base_url <> ""} ->
        {:error, :timeout}
      end)

      response = Client.get_pokemon("")

      expected_response = {:error, :timeout}

      assert expected_response == response
    end
  end
end
