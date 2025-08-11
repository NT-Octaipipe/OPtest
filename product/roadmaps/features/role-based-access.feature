Feature: Role-based access and management

  Scenario Outline: User accesses portal and sees only relevant resources
    Given <actor> logs into the portal
    When <actor> views the list of <resource_type>
    Then <actor> should see only resources assigned to their role

    Examples:
      | actor   | resource_type   |
      | Alice   | devices         |
      | Bob     | models          |
      | Carol   | experiments     |
      | Dave    | devices         |
      | Eve     | models          |

  Scenario: Assign multiple roles to a user
    Given Frank is assigned the roles "Facility Manager" and "Data Scientist"
    When Frank logs in
    Then Frank should see resources for both roles

  Scenario: Attempt to access resource with no permission
    Given Grace logs in as "Sustainability Lead"
    When Grace tries to access "Admin Panel"
    Then Grace should see an access denied message
