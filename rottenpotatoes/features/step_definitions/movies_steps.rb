
Given /the following movies exist/ do |movie_table|
  movie_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |movie_1, movie_2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(movie_1) < page.body.index(movie_2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    movie_tile = movie.title
    step %{I should see "#{movie_tile}"}
  end
end

Then /^the director of "(.*)" should be "(.*)"/ do |movie_title, movie_director|
  movie = Movie.where(title: movie_title).first
  expect(movie.director).to eq(movie_director)
end