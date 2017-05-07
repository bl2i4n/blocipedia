module TestData
  def self.wiki_title
    title = []
    intro = ["This is the beginning of the end", "History and Past of", "Once upon a life of", "Avengers Assembled because of", "The fight club started here", "The number one issue of", "The only reason by"]
    subject = ["Chris Pratt", "Johnny Depp", "Chris Hemsworth", "Samuel L. Jackson", "Jessica Biel", "Charlize Theron", "Luke Skywalker"]
    title << intro.sample
    title << subject.sample
    title.join(" ")
  end

  def self.wiki_body
    "The quick, brown fox, jumped over the lazy dog, over by the, hedge of the river. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end

end
