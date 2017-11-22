# Moosi

Moosi intends to be a simple inventory app for small gardeners. You have a list of your plants, with details like price, how many plants are in which store and how many seedlings of each plant you have. 

It is possible to add plants to an order (in a future version this should be printable as an invoice) or a packing list (for when you sell on markets and want to refill your truck).

The app is at the stage of going into beta test, but since then lost interest and development stalled.

There is a [demo](http://moosi.herokuapp.com) online (it takes a moment to load) and it uses German language, but hopefully gives you an idea.


## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM)
* [Bower](http://bower.io/)
* [Ember CLI](http://www.ember-cli.com/)
* [PhantomJS](http://phantomjs.org/)
* [Moosi Backend](http://github.com/koenig/moosi-back)

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `npm install`
* `bower install`

## Running / Development

* start moosi backend
* `ember server`
* Visit your app at [http://localhost:4200](http://localhost:4200).

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details

### Running Tests

* `ember test`
* `ember test --server`

### Building

* `ember build` (development)
* `ember build --environment production` (production)

### Deploying

Deployment was quite easy on heroku. It still is, but since development of this app in 2015, some dependencies break and it's currently not possible to push to heroku without the build failing. It wont be hard to fix, but since there seems to be no interest in this app, I put my time into more useful things.

## Further Reading / Useful Links

* [ember.js](http://emberjs.com/)
* [ember-cli](http://www.ember-cli.com/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)

