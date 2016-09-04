Fabricator(:reign) do
  user
  weapon { Faker::Lorem.word }
end
