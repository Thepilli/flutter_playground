## https://script.google.com/home/projects/1YaGPNfaMjUuyR4-CDyehXGajosnY7BMBeGgVYNJVwNstit3SFgN7H9xf/edit

import requests
from bs4 import BeautifulSoup


def idealni(
    url,
    title_div,
    title_class,
    title_classtext,
    content_div,
    content_class,
    content_classtext,
    filename,
):
    # Send a GET request to the URL and get the response
    response = requests.get(url)

    # Parse the HTML content of the response using BeautifulSoup
    soup = BeautifulSoup(response.content, "html.parser")

    # Find the title and content elements using the provided CSS selectors
    title = str(soup.find(title_div, {title_class: title_classtext}))
    content = str(soup.find(content_div, {content_class: content_classtext}))
    # abstract = str(soup.find('div', {'class': 'article__abstract'}))sladke

    # Create a new HTML file
    with open(filename, "w", encoding="utf-8") as f:
        # Write the title and content to the file as strings
        f.write(title)
        # f.write(abstract)
        f.write(content)


# Sample function call
# scrape_blog(
#     url="https://atypmagazin.cz/profesorka-papezova-poruchy-prijmu-potravy-jsou-zacarovany-kruh/",
#     title_div="div",
#     title_class="class",
#     title_classtext="elementor-element elementor-element-d4f8359 elementor-widget elementor-widget-theme-post-title elementor-page-title elementor-widget-heading",
#     content_div="div",
#     content_class="class",
#     content_classtext="elementor-element elementor-element-414cdffb elementor-widget elementor-widget-theme-post-content",
#     filename="profesorka_papezova_poruchy_prijmu_potravy_jsou_zacarovany_kruh.html",
# )


idealni(
    url="https://www.idealni.cz/nasledky-mentalni-anorexie-a-bulimie/",
    title_div="header",
    title_class="class",
    title_classtext="entry-content-header",
    content_div="div",
    content_class="class",
    content_classtext="entry-content",
    filename="i_nasledky_mentalni_anorexie_a_bulimie.html",
)

# nzip(
#     url="https://www.nzip.cz/clanek/700-poruchy-prijmu-potravy-jak-rozpoznat-priznaky",
#     title_div="div",
#     title_class="class",
#     title_classtext="article__title",
#     content_div="div",
#     content_class="class",
#     content_classtext="article__content",
#     filename="ppp_priznaky.html",
# )

# healthyandfree(
#     url="http://www.healthyandfree.cz/index.php/koronavirus/item/407-a-ty-se-nechces-vylecit",
#     title_div="h2",
#     title_class="class",
#     title_classtext="itemTitle",
#     content_div="div",
#     content_class="class",
#     content_classtext="itemFullText",
#     filename="lecba.html",
# )

# hladovydenik(
#     url="http://hladovydenik.blogspot.com/2014/12/uvodem.html",
#     title_div="h3",
#     title_class="class",
#     title_classtext="post-title entry-title",
#     content_div="div",
#     content_class="class",
#     content_classtext="post-body entry-content",
#     filename="hladovy_denik_uvodem.html",
# )
