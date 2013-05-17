require 'digest/md5'

module Jekyll
  class AudioTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      if /(?<fileurl>\S+)?/i =~ markup
        @audiotagurl = fileurl
      end
      super
    end

    def render(context)
      if @audiotagurl
        "<p/>
<center>
<audio src=\"#{@audiotagurl}\" preload=\"none\" />
</center>
<p/>"
      else
        "Error processing input, expected syntax: {% audio fileurl %}"
      end
    end
  end
end

Liquid::Template.register_tag('audio', Jekyll::AudioTag)
