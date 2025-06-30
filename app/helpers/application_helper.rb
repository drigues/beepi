module ApplicationHelper
  def inline_svg(filename, options = {})
    file_path = Rails.root.join("app/assets/images", filename)
    return "(not found)" unless File.exist?(file_path)

    file = File.read(file_path)
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    svg = doc.at_css("svg")
    svg["class"] = options[:class] if options[:class]
    doc.to_html.html_safe
  end
end
