# frozen_string_literal: true

module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language = "erb" if language.blank?
      CodeRay.scan(code, language).div(line_numbers: :table, css: :class)
    end
  end

  def markdown(text)
    code = CodeRayify.new(filter_html: true, hard_wrap: true, link_attributes: { rel: "nofollow", target: "_blank" })
    options = {
      fenced_code_blocks: true,
      hard_wrap: true,
      no_intra_emphasis: true,
      autolink: true,
      strikethrough: true,
      lax_html_blocks: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
      tables: true,
      space_after_headers: true,
      disable_indented_code_blocks: true,
      no_images: true,
      no_links: false,
      no_styles: true,
      safe_links_only: true,
      with_toc_data: true,
      lax_spacing: true,
      gh_blockcode: true
    }
    markdown_to_html = Redcarpet::Markdown.new(code, options)
    markdown_to_html.render(text)
  end
end
