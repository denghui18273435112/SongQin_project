# coding:utf8
from selenium import webdriver
import time

def deleteAllCourse(username, password):  #删除列表中的所有课程方法
    driver = webdriver.Firefox()
    driver.implicitly_wait(10)
    driver.get('http://localhost/mgr/login/login.html')
    driver.find_element_by_id('username').send_keys(username)
    driver.find_element_by_id('password').send_keys(password)
    driver.find_element_by_tag_name('button').click()
    driver.implicitly_wait(2)
    while True:
        deleteButtons = driver.find_elements_by_css_selector(
            "button[ng-click^='delOne']")
        if deleteButtons==[]:
            break
        deleteButtons[0].click()
        driver.find_element_by_css_selector('button.btn-primary').click()
        time.sleep(1)

    driver.implicitly_wait(5)
    driver.quit()

