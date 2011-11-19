# TwitterEnvy

A full featured Twitter clone written in Ruby on Rails 3 and jQuery.

Be sure to follow me on twitter, @AndySharkey

# Setup

The application relies on two gems that require set up before it can run.

The first gem you'll need to set up is Amazon S3 ("aws-s3") gem, which will store the image files for the application. 

In order to use the Amazon S3 gem, you must have an Amazon S3 account (it's free!), and must create a bucket for storing files. Create your S3 account here: http://aws.amazon.com/s3/

Once you create your S3 account and have created a bucket, you'll need to take note of three pieces of information: Your key, your secret, and your bucket name.

A new file must created in the config directory of your application that defines the following:

```
	ENV['S3_KEY']            = 'Your Key Goes Here'
	ENV['S3_SECRET']         = 'Your Secret Goes Here'
	ENV['S3_BUCKET']         = 'Your Bucket Name Goes Here'
```

The second gem you'll need to set up is the Solr search engine gem Sunspot ("sunspot_rails").


In order to run the application locally, you'll need to invoke the following commands:

```
rake sunspot:solr:start
```

If you run into difficulties with Sunspot, you can read a guide provided by Heroku (includes information on running locally) here: http://devcenter.heroku.com/articles/websolr
