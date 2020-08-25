# 资源文件



*** Settings ***
Library    SeleniumLibrary
Library    Collections

#RF用户关键封装
*** Keywords ***


# 打开浏览器关键字
Setup WebTest
    Open Browser   http://localhost/mgr/login/login.html    Firefox
    Set Selenium Implicit Wait   10

# 关闭浏览器 关键字
Teardown WebTest
    Close Browser


#登录 关键字
login
    [Arguments]   ${username}    ${password}
    Input Text   id=username    ${username}
    Input Text   id=password    ${password}
    Click Element   tag=button
    Click Element   css=button[ng-click^=showAddOne]




# 删除所有的课程信息  关键字
DeleteAllLesson
    Login  &{adminuser}[name]    &{adminuser}[pw]
    click element  css=ul > li:nth-child(2)

    set browser implicit wait  2

    :For   ${one}  IN RANGE  9999
       \   ${html}=  Get Webelement  tag=html
       \   ${eles}=  Evaluate   $html.find_elements_by_css_selector("button[ng-click^='delOne']")
       \   Exit For Loop If   $eles==[]
       \   Click Element   @{eles}[0]
       \   Click Element   css=button.btn-primary
       \   sleep  1


#创建课程   关键字
add course
    [Arguments]   ${name}    ${desc}    ${idx}
    input text      css=input[ng-model='addData.name']    ${name}
    input text      css=textarea[ng-model='addData.desc']    ${desc}
    input text      css=input[ng-model='addData.display_idx']    ${idx}
    Click Element   css=button[ng-click^=addOne]
    sleep   2


#获取课程名单 关键字
get List course        #获取课程的所有名单,并返回
    ${eles}=    Get Webelements  css=tr>td:nth-child(2)
    ${lessons}=    create list      # 创建一个列表
    :FOR   ${ele}   IN   @{eles}
       \   log to console    ${ele.text}
       \   Append To List   ${lessons}   ${ele.text}
    [Return]   ${lessons}


# 删除所有的课程信息  关键字
DeleteAllTeacher
    Login  &{adminuser}[name]    &{adminuser}[pw]

    click element  css=ul > li:nth-child(2)

    set browser implicit wait  2

    :For   ${one}  IN RANGE  9999
       \   ${html}=  Get Webelement  tag=html
       \   ${eles}=  Evaluate   $html.find_elements_by_css_selector("button[ng-click^='delOne']")
       \   Exit For Loop If   $eles==[]
       \   Click Element   @{eles}[0]
       \   Click Element   css=button.btn-primary
       \   sleep  1
     set browser implicit wait  10
