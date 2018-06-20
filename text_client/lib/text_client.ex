defmodule TextClient do
  @moduledoc """
  This module contains the magical APIs for TextClient.

  Why magical?
  Run the module and you will know.
  """

  defdelegate start(), to: TextClient.Interact

end
