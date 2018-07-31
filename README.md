# Talksome

One common criticism of social networks in today's media economy is that the algorithms which personalize content tend to curate content that appeals strictly to a user's preferences while neglecting to inform them in a balanced manner about other viewpoints or more important events. Eli Pariser brought attention to this issue in 2011 with his TED talk on "Filter Bubbles," and after the recent election numerous journalists and personalities have decried the ills of echo chambers which protect from opposing views. That's why I created Talksome, a new type of social network which avoids echo chambers and algorithms designed to keep you glued to the screen at the expense of a healthy information diet.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ cd ~/tmp
$ git clone https://github.com/Talksome/talkso.me.git
$ cd talkso.me
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## License

This code is available under the MIT License. See `LICENSE` for more information.
