{CSS} = require "nice"
theme = require "../theme"
{include,w} = require "fairmont"

module.exports = class Application extends CSS
  
  constructor: ->
    
    super
    
    @theme = require "../theme"
    
    @mixin CSS.Colors, CSS.Theme, CSS.Basics, CSS.Typography,
      CSS.Grid, CSS.Forms, CSS.Buttons
      
    @breakpoint 
      large: """
        screen and (min-width: 960px)
      """
      medium: """
        screen and (min-width: 480px) and (max-width: 960px)
      """
      small: """
        screen and (min-width: 240px) and (max-width: 480px)
      """
      desktop: """
        screen and (min-width: 72rem)
        """
      tablet: """
        screen and (min-width: 48rem) 
        and (max-width: 72rem)
        """
      mobile: """
        screen and (min-width: 20rem)
        and (max-width: 48rem)
        """
        
  main: ({status,rhythm,scale}) ->
    
    {contains,child,sibling,variant} = CSS.combinators
    
    @breakpoint ({desktop, tablet, mobile, large, medium, small}) =>
      
      scale (1+1/8)
      
      @rule "body", =>
        @margin "auto"
        @marginTop "2rem"
        @width "60rem"
  
      status "success"
      status "alert"

      rhythm (1+1/4), ({typeSize}) =>
        for n in [1..5]
          @rule "h#{n}", ({heading}) =>
            do heading
            @marginTop "2rem"
            typeSize 6-n
        
          @rule "h#{n} + h#{n}", =>
            @fontWeight "normal"
            @marginTop "-1rem"
          
          @rule "h#{n}:first-child", =>
            @marginTop "0"
          
        @rule "footer", =>
          @width "100%"
          @paddingTop "1rem"
          @marginTop "1rem"
          @borderTop "1px solid silver"
          @textAlign "center"
        
        @rule "footer", "footer p", =>
          @fontFamily @theme.fonts.headings
          typeSize 1

      rhythm (0.8), ({typeSize}) =>

        @context "nav", =>
      
          @rule =>
            @marginBottom "2rem"

          @context contains(".logo"), =>
      
            @rule ({cell}) =>
              do cell
              @verticalAlign "middle"
              @width "24rem"
      
            @rule contains("h1"), =>
              typeSize 6
              @letterSpacing "0.25rem"
              @color "black"
              @fontFamily @theme.fonts.body
    
          @context contains(".blurb"), =>
      
            @rule ({cell}) =>
              do cell
              @paddingLeft "2rem"
              @verticalAlign "middle"
              @width "30rem"
    
            rhythm (1+1/6), ({typeSize}) =>

              @rule contains("p"), =>
                typeSize 2
                @fontFamily @theme.fonts.headings
          
      rhythm (1+5/8), ({typeSize}) =>
      
        @rule ".feature", ({cell}) =>
          do cell
          typeSize 2
          @verticalAlign "top"
          @width "42rem"
          @overflow
      
        @rule "aside", ({cell}) =>
          do cell
          @verticalAlign "top"
          @width "18rem"
                  
        # TODO: refactor this into a list mixin, so that we can
        # more easily set up bulleted lists
        @rule ".feature ul, aside ul", =>
          @marginLeft "2em"

        @context ".blog.summary", =>
          
          @rule contains("ul"), =>
            @margin "0"
            @padding "0"
            @listStyle "none"
          
          @context contains("li"), =>
            
            @rule =>
              @marginBottom "2rem"
              @clear "both"
              
            @rule contains(".note"), =>
              @display "none"
            
            @context contains("figure"), =>
              @rule =>
                @width "14rem"
                @float "right"
                @marginRight 0
                @marginLeft "2rem"

              @rule contains("img"), =>
                @width "13rem"

              @rule contains(".icon"), =>
                @fontSize "8rem"
                @textAlign "center"

          
        @context contains(".byline"), =>
          
          @rule =>
            @fontFamily @theme.fonts.labels
            @marginTop "-1rem"
          
          @rule contains(".author"), contains(".published"), =>
            @marginRight "0.5rem"
          
          @rule contains(".author"), =>
            @fontWeight "bold"
      
      
        @context ".blog", ".article", =>

          @rule =>
            @position "relative"
            @width "42rem"

          @context contains("figure"), => 
          
            @rule =>
              @float "left"
              @width "19rem"
              @marginRight "2rem"
              @marginLeft 0
              @marginBottom "1rem"
              @padding "0.5rem"
              @border "1px solid silver"

            @rule contains("img"), =>
              @width "18rem"

            @rule contains(".icon"), =>
              @fontSize "12rem"
              @textAlign "center"

            @rule contains("figcaption"), =>
              typeSize 1
              @fontWeight "bold"
              @paddingTop "0.5rem"
              @paddingBottom "0.5rem"
              @borderTop "1px solid silver"
              @fontFamily @theme.fonts.labels

        @rule contains("blockquote"), =>
          @fontSize "75%"
          @color @lighten(@theme.colors.foreground, 0.33)

        @context ".post", =>
          @rule contains(".note"), =>
            @position "absolute"
            @left "44rem"
            typeSize 1
            @marginTop "1rem"
            @width "14rem"
      
      @rule ".panel", =>
        @width "100%"
        @textAlign "right"
        @marginTop "1rem"

      @context ".button", ({button}) =>
        do button
      
      @rule ".panel .button", =>
        @marginRight "1rem"
      
      @rule ".bump.down.one", =>
        @marginTop "1rem"

      @context "form", ({form}) =>
        form (rules) =>
          @context contains(".mc-field-group"), rules

    @text """
      @font-face {
        font-family: 'Heydings';
        src: url('/font/heydings_icons-webfont.eot');
        src: url('/font/heydings_icons-webfont.eot?#iefix') format('embedded-opentype'),
             url('/font/heydings_icons-webfont.woff') format('woff'),
             url('/font/heydings_icons-webfont.ttf') format('truetype'),
             url('/font/heydings_icons-webfont.svg#heydings_iconsregular') format('svg');
        font-weight: normal;
        font-style: normal;
      }

    """

    @rule "nav .panel", => @textAlign "left"

    @rule "a.rss:before", =>
      @fontFamily "'Heydings'"
      @content "'R '"

    @rule ".icon", =>
      @fontFamily "'Heydings'"

