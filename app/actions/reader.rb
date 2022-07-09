# frozen_string_literal: true

# Reader
module Reader
  def self.get_text_from_file(file)
    pdf = PDF::Reader.new(file.path)
    texts = pdf.pages.map { |page| page.text }

    {
      texts: texts,
      pages: pdf.page_count
    }
  end
end
