# Finn Mack Web Site

This is the code that powers the PandaStrike Web site.

## Getting Started

* Make sure you have `harp` installed.

        npm install -g harp

* Change to the project directory.

* Install the dependencies:

        npm install

* Run the `harp` server:

        harp server -p <port>
      
Replace `<port>` with whichever port number you want to use.

You should get some output that displays the Harp ASCII art logo and then a message like this:

    Your server is listening at http://localhost:9000...

* Verify that the site looks as you expect in the browser.

* Compile (build) the site:

        harp compile

This will build the site into the `www` directory.

* Publish to s3:

        harp compile && coffee scripts/publish.coffee <env>

This will publish all the content in `www` to s3. **Be sure to call `harp compile` before publishing** (as shown) or you may end up publishing the gzip artifacts from a prior publish.

Replace `<env>` with the name of the environment you want to use. The environment is specified within the `s3.cson` file, described below.

## Configuration

The `s3.cson` configuration tells the publish task which bucket to use. This typically describes an object whose properties are configuration environments (ex: `development`, `production`). The value of these properties are objects with  `bucket` property, specifying the name of the bucket to use for that environment. Ex:

    development:
      bucket: "mytestbucket.com"
