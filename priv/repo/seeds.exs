# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HubApi.Repo.insert!(%HubApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

HubApi.Repo.insert!(%HubApi.Schema.Semester{semester_name: "FALL"})
HubApi.Repo.insert!(%HubApi.Schema.Semester{semester_name: "SPRING"})
HubApi.Repo.insert!(%HubApi.Schema.Semester{semester_name: "SUMMER"})
