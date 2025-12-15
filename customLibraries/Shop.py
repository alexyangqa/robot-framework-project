import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        # Get WebElements
        i = 1
        productsTitles = self.selLib.get_webelements(" css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

            i = i + 1
        # time.sleep(10)
        self.selLib.click_link("css:li.active a")



        # try:
        #     self.selLib.click_element("css:.navbar-nav .nav-link.btn.btn-primary")
        # except Exception:
        #     # fallback for collapsed menu
        #     if self.selLib.is_element_visible("css:.navbar-toggler"):
        #         self.selLib.click_button("css:.navbar-toggler")
        #         self.selLib.wait_until_element_is_visible("css:.navbar-nav .nav-link.btn.btn-primary")
        #         self.selLib.click_element("css:.navbar-nav .nav-link.btn.btn-primary")



        # self.selLib = BuiltIn().get_library_instance('SeleniumLibrary')
        #
        # is_visible = BuiltIn().run_keyword_and_return_status(
        #     "Element Should Be Visible", "css:.navbar-toggler"
        # )
        # if is_visible:
        #     self.selLib.click_button("css:.navbar-toggler")
        #     self.selLib.wait_until_element_is_visible("css:.navbar-nav .nav-link.btn.btn-primary", timeout="5s")
        #
        # self.selLib.click_element("css:.navbar-nav .nav-link.btn.btn-primary")










