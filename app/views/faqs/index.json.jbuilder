json.array!(@faqs) do |faq|
  json.extract! faq, :id, :title, :body, :faq_update
  json.url faq_url(faq, format: :json)
end
