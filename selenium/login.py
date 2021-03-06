# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
import logging

# Start the browser and login with standard_user
def login (user, password):
    logging.basicConfig(filename='selenium.log', level=logging.DEBUG, format='%(asctime)s %(levelname)s %(message)s')
    
    logging.info('Starting the browser...')
    # --uncomment when running in Azure DevOps.
    options = ChromeOptions()
    options.add_argument("--headless") 
    driver = webdriver.Chrome(options=options)
    #driver = webdriver.Chrome()
    
    # Test Login to the site
    logging.info('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')
    driver.find_element_by_css_selector("input[id='user-name']").send_keys(user)
    driver.find_element_by_css_selector("input[id='password']").send_keys(password)
    driver.find_element_by_css_selector("input[id='login-button']").click()

    path_content_div = "div[id='page_wrapper'] > div[id='contents_wrapper'] > div[id='inventory_container'] > div"
    results = driver.find_element_by_css_selector(path_content_div + " > div[class='header_secondary_container'] > div[id='inventory_filter_container'] > div[class='product_label']").text
    assert "Products" in results
    logging.info("Successfully logged in as " + user)

login('standard_user', 'secret_sauce')

