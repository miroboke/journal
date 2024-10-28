class ButtonComponent < ViewComponent::Base
  attr_reader :text, :size

  def initialize(text:, size: :default, variant: :default, other_css_class: "")
    @text = text
    @size = size
    @variant = variant
    @other_css_class = other_css_class
  end

  def style_class
    base_class = "inline-flex items-center justify-center gap-2 whitespace-nowrap \
    rounded-md text-sm font-medium ring-offset-neutral-200 transition-colors focus-visible:outline-none \
    focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none \
    disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0"

    variant_class = case @variant
    when :secondary then "bg-neutral-200 text-neutral-800 hover:bg-neutral-200/80"
    else "bg-neutral-800 text-neutral-200 hover:bg-neutral-800/90"
    end

    size_class = case @size
    when :small then "h-9 rounded-md px-3"
    when :large then "h-10 px-4 py-2"
    else "h-10 px-4 py-2"
    end

    "#{base_class} #{variant_class} #{size_class}".strip
  end
end
