## What is this?

Intersects the Foursquare todo list of you and one of your friends.

Check out a running version here: https://todosincommon.herokuapp.com

Note that this is all very hacky, just a fun little side project for my own amusement.

## Setup

In order to run your own register an app here: https://foursquare.com/developers/apps

If you are deploying on heroku:

    heroku login
    heroku create
    heroku config:set FOURSQUARE_CLIENT_ID=<yourclientid>
    heroku config:set FOURSQUARE_SECRET=<yoursecret>

    git push heroku master
