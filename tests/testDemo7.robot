*** Settings ***
Documentation   To validate API
Library     BuiltIn
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}    
${book_name}    RobotFramework

*** Test Cases ***
Play around with dictionary
    [Tags]    API
    ${data} =    Create Dictionary    name=rahulshetty    course=robot    website=rahulshettyacademy.com
    Log    ${data}
    Dictionary Should Contain Key    ${data}    name
    Log    ${data}[name]
    ${url} =    Get From Dictionary    ${data}    website
    Log    ${url}

Add book into library database
    [Tags]    API
    ${req_body} =    Create Dictionary    name=${book_name}   isbn=abc    aisle=569   author=John Foe
    ${response} =    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id} =    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}
        
Get the book details
    [Tags]    API
    ${get_response} =    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${get_response.json()}[0][book_name]    ${book_name}
    
Delete the book from database
    [Tags]    API
    ${delete_request} =    Create Dictionary    ID=${book_id}
    ${delete_response} =    POST    ${base_url}/Library/DeleteBook.php    json=${delete_request}    expected_status=200
    Log    ${delete_response.json()}[msg]
    Should Be Equal As Strings    book is successfully deleted    ${delete_response.json()}[msg]