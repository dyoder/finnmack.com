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
        &copy; 2012-2013 Finn Mack, All Rights Reserved
        """

  logo: ->
    @div class: "logo", =>
      @a href: "/", => @h1 "Finn Mack"
      
  blurb: ->
    @div class: "blurb", =>
      @p "Author of <em>Qubit</em>. Coming soon to an ebook store near you."
      
  feature: ->
    @div class: "feature", =>
        