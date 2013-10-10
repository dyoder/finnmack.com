{HTML} = require "nice"
{read,w} = require "fairmont"
{resolve} = require "path"
markdown = require "marked"

module.exports = class Frame extends HTML
  
  @scripts: w( "modernizr json2 jquery-2.0.2.min 
    underscore-min backbone-min coffee-script application" )
  
  @stylesheets: w( "normalize fonts application" )
  
  main: ->
    
    do @doctype

    @html =>

      @head =>
        
        @title "Finn Mack&mdash;author of Qubit"
        
        @meta charset: "utf-8"

        @meta 
          name: "viewport"
          content: "width=device-width, initial-scale=1.0"

        for script in Frame.scripts
          @script src: "/js/#{script}.js", type: "text/javascript"

        for sheet in Frame.stylesheets
          @link href: "/css/#{sheet}.css", type: "text/css", rel: "stylesheet"

        @link rel: "shortcut icon", href: "/img/favicon.png", type: "image/png"

        @script """
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-44034391-1', 'finnmack.com');
          // ga('send', 'pageview');
        """

      @body =>
        do @content

  content: ->
    @header =>
      @nav =>
        do @logo
        do @blurb
    do @feature
      
    @footer =>
      @text markdown """
        &copy; 2012-2013 [Finn Mack](/page/about-me), All Rights Reserved
        """

  logo: ->
    @div class: "logo", =>
      @a href: "/", => @h1 "Finn Mack"
      
  blurb: ->
    @div class: "blurb", =>
      @p =>
        @text markdown """
          Author of *Qubit*. Now available in the [Kindle bookstore][amazon].

          [amazon]:http://www.amazon.com/Qubit-ebook/dp/B00F45N40O/ref=sr_1_13?s=digital-text&ie=UTF8&qid=1378941414&sr=1-13
          """

        @div class: "panel", =>
          @a class: "small success button", href: "/page/about-me", "Join The Mailing List"
          @a class: "rss small success button", href: "http://feeds.feedburner.com/FinnMack", "Subscribe"
  feature: ->
    @div class: "feature", =>
        