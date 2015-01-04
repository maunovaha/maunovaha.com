BEFORE RELEASE:

SUNDAY:

  + Make tags to work properly
    + Fix tag page to show short descriptions of first posts..
    + Fix posts tag links to be correct
    - Fix styles of the page to correct .scss file (no inline styles).
    - Commit..

  - Make archives to work properly
    -
    -
    -
    -

  - Add next and previous buttons under posts

- Add page (post) specific google analytics tracking
  - Add link specific analytics tracking for places where it is needed (events with important links like pdf.)

- Add discus commenting for blog posts
- Fix mobile rules of header
- Fix to work with IE
- Add default encoding and timezone (jekyll)
- Add spacing to all paragraphs in posts etc.
- Fix language issues of a post
- Add copyright notice to github (c) Mauno Vähä

AFTER RELEASE:
- Add navigation between posts
- Move previous projects to same place in github (open source)

h1,
h2,
h3,
h4,
h5,
h6,
label {
  color: #34495e;
}

var game = new Game({
  stage: "An epic journey of a man from beginner to pro in game programming.",
  difficulty: DIFFICULTIES.HARD,
  players: [
    new Player({
      nickname: "@maunovaha",
      items: [ new Item("Computer"),
               new Item("Coffee"),
               new Item("Sexy Leather Tunic") ]
    })
  ]
});

// ..and let the journey begin.. http://maunovaha.com
game.begin();
