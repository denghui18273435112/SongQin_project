*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          rflib/rfResources.robot
Library           pylib/pyMethods.py
Suite Setup     Setup WebTest
Suite Teardown     Teardown WebTest

*** Test Cases ***
test1

    login    auto    sdfsdfsdf
    add course    初中化学    初中化学描述    1
    ${lessons}=    get List course
    Should Be True    $lessons==[u'初中化学']


