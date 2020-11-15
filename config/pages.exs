use Mix.Config

# This file describes how many pages should be checked, and how often
# When the last item for each of these page ranges is stored in PostGres,
# it persists across runs
#
# the numbers below describe SFW page ranges, NSFW are requested at the same time,
# running with floor(n/2.5)

defmodule T do
  def days(dys) when is_integer(dys), do: :timer.hours(24) * dys
  def ms_to_s(ms), do: div(ms, 1000)
end

# infinite is checking all pages

# the order of pages here describes the hierarchy
# i.e. if we check 40 pages, we can mark 20, 8 and 3 as done
config :checker_mal,
  anime_pages: [
    {3, T.ms_to_s(:timer.minutes(30))},
    {8, T.ms_to_s(:timer.hours(8))},
    {20, T.ms_to_s(T.days(4))},
    {40, T.ms_to_s(T.days(10))},
    {:unapproved, T.ms_to_s(T.days(30))},
    {:infinite, T.ms_to_s(T.days(60))}
  ],
  manga_pages: [
    {3, T.ms_to_s(:timer.minutes(30))},
    {8, T.ms_to_s(:timer.hours(8))},
    {20, T.ms_to_s(T.days(4))},
    {40, T.ms_to_s(T.days(10))},
    {:unapproved, T.ms_to_s(T.days(30))},
    {:infinite, T.ms_to_s(T.days(60))}
  ]
