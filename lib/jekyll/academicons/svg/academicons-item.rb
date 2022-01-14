require 'jekyll/academicons/svg/academicons-icon'

module Jekyll
  module Academicons
    module Svg
      class AcademiconsItemGenerator < Liquid::Tag
        def initialize(tag_name, markup, tokens)
          super
          @tmp_markup = markup
        end

        def render(context)
          faIcon = context[@markup] ||= @tmp_markup
          @icon = AcademiconsIcon.new(faIcon.strip)
          unless context.environments.first['page']['academicons_svg'].is_a?([]::class)
            context.environments.first['page']['academicons_svg'] = []
          end
          context.environments.first['page']['academicons_svg'].push(@icon.value)
          "<svg class=\"academic-icon\"><use xlink:href='##{@icon.value}'></use></svg>"
        end
      end
    end
  end
end
