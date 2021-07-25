module BookHelper
  def book_card(book)
    if book.image.attached?
      concat image_tag url_for(book.image), { class: "img-thumbnail", size: "200" }
    else
      concat image_tag "default_cover.png", { class: "img-thumbnail", size: "200" }
    end
    concat link_to book.title, book
    tag.p("$#{book.price}")
  end
end
