Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 2 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Egg" with price 4.00 and stock of 15 exists

Scenario Outline: Buy one product
   When I buy <product> with quantity <quantity>
   Then total should be <total>
   Examples:
       | product  | quantity |  total  |
       | "Bread"  |     1    |   20.50 |
       | "Jam"    |     2    |  160.00 |

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "Egg" with quantity 10
    Then total should be 161.00

Scenario: Buy product over stock
    When I over buy "Bread" with quantity 5
    Then I cannot buy "Bread" with quantity 5