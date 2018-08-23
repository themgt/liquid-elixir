defmodule Liquid.Translators.MarkupTest do
  use ExUnit.Case
  alias Liquid.Translators.Markup

  test "transforms {:parts} tag" do
    assert Markup.literal(
             {:parts, [{:part, "company"}, {:part, "name"}, {:part, "employee"}, {:index, 0}]}
           ) == "company.name.employee[0]"

    assert Markup.literal(
             {:parts,
              [
                {:part, "company"},
                {:part, "name"},
                {:part, "employee"},
                {:index, {:variable, [parts: [part: "store", part: "state", index: 1]]}}
              ]}
           ) == "company.name.employee[store.state[1]]"
  end
end
