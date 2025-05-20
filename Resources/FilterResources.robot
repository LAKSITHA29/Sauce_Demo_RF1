*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Click filter options Low to High
    Select From List By Index    class=product_sort_container    2 
    Sleep     5   
  
Click filter options High to Low
    Select From List By Index    class=product_sort_container    3 
    Sleep    5

# Verify products are sorted from price Low to High
#    @{Expected_lohi}=     Create List     $7.99    $9.99    $15.99    $15.99    $29.99    $49.99  
#    ${actual_price}=       Get WebElements      class=inventory_item_price
#    @{sorted_list}=    Create List
#    FOR    ${e}    IN     @{actual_price}
#       Log    ${e.text}
#       Append To List    ${sorted_list}    ${e.text}
#     END
#     Lists Should Be Equal    @{Expected_lohi}    @{sorted_list}   
Verify products are sorted from price Low to High
    ${Expected_lohi}=     Create List     $7.99    $9.99    $15.99    $15.99    $29.99    $49.99  
    ${actual_price}=      Get WebElements      class=inventory_item_price
    ${sorted_list}=       Create List
    FOR    ${e}    IN     @{actual_price}
        ${text}=    Get Text    ${e}
        Append To List    ${sorted_list}    ${text}
    END
    Lists Should Be Equal    ${Expected_lohi}    ${sorted_list}
 
# Verify products are sorted from price High to Low
#     ${Expected_lohi}=     Create List     $7.99    $9.99    $15.99    $15.99    $29.99    $49.99  
#     ${High_to_low}=    Reverse List    ${Expected_lohi}
#     ${actual_price}=      Get WebElements      class=inventory_item_price
#     ${sorted_list}=       Create List
#     FOR    ${e}    IN     @{actual_price}
#         ${text}=    Get Text    ${e}
#         Append To List    ${sorted_list}    ${text}
#     END
#     Lists Should Be Equal    ${High_to_low}    ${sorted_list}
# TypeError: Expected argument 1 to be a list or list-like, got None instead.

Verify products are sorted from price High to Low
    ${Expected_lohi}=     Create List     $7.99    $9.99    $15.99    $15.99    $29.99    $49.99  
    ${High_to_low}=       Copy List    ${Expected_lohi}
    Reverse List          ${High_to_low}
    ${actual_price}=      Get WebElements      class=inventory_item_price
    ${sorted_list}=       Create List
    FOR    ${e}    IN     @{actual_price}
        ${text}=    Get Text    ${e}
        Append To List    ${sorted_list}    ${text}
    END
    Lists Should Be Equal    ${High_to_low}    ${sorted_list}


