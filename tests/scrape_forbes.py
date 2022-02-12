#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import FirefoxOptions
import os
import time


# script directory
abspath = os.path.abspath(__file__)
script_dir = os.path.dirname(abspath)
os.chdir(script_dir)

# set dir to temp folder
os.chdir("../tmp")

#  driver
opts = FirefoxOptions()
opts.headless = True
opts.add_argument("--width=1920")
opts.add_argument("--height=1080")

driver = webdriver.Firefox(options = opts)


url = "https://www.forbes.com/real-time-billionaires"
driver.get(url)

time.sleep(10)
  
# click on list     
path = '/html/body/div[2]/div[2]/div/div[2]/div[1]/div/section[5]/div[2]/div/div[4]/div[1]/table/tbody/tr[1]/td[2]/div/span'
element = driver.find_element_by_xpath(path)
element.click()
time.sleep(5)

# click again to have descending order
element.click()
time.sleep(5)

# select body
body = driver.find_element_by_css_selector('body')

# scrape the site
scrape = True 
i = 0
n_old = 0

while scrape:

    body.send_keys(Keys.PAGE_DOWN)
    time.sleep(0.1)
    
    i = i + 1
    
    # if 100 pagedown, download page
    if not i % 200:
        page_download = driver.find_element_by_tag_name('html').get_attribute('innerHTML')
        time.sleep(1)
        
        index = str(i)
        index = index.zfill(4)
        
        # export page
        tmp = "tmp" + index + ".txt"
        
        f = open(tmp, "a")
        f.write(page_download)
        f.close()

        # test if new data
        n_new = len(page_download)
        diff = abs( n_new - n_old )
        
        if diff < 5000 and i > 1000:
            scrape = False    
    
        # print meta
        print("diff:", diff)
        print("iteration:", i)
    
        # update old data
        n_old = len(page_download)


# close web driver
driver.close()
driver.quit()
